package model;

import java.util.ArrayList;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;

public class MiraDAO {
	private EntityManagerFactory emf;
	
	
	public MiraDAO(EntityManagerFactory emf) {
		super();
		this.emf = emf;
	}

	public boolean criarUsuario(String usuario, String senha, String email, String imgUser) {

		EntityManager em = emf.createEntityManager();
		
		try {
			Mira pessoa = new Mira(usuario, senha, email, imgUser);
			em.getTransaction().begin();
			em.persist(pessoa);
			em.getTransaction().commit();
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			em.close();
		}

	}

	public Mira verificarUsuario(String email) {
		
		EntityManager em = emf.createEntityManager();
		Mira user = null;
		
		try {
			
			user = em.find(Mira.class, email);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			em.close();
		}
			return user;

	}
	
	 public Mira verificarLogin(String usuario) {
		 

			EntityManager em = emf.createEntityManager();
			Mira user = null;
		 
		 try {
			 
				user = em.find(Mira.class, usuario);
			  
		 }catch(Exception e) {
			 
			 e.printStackTrace();
			 
		 }finally {
		 
			em.close();
		 }
		 return user;
	 }
	 
	public boolean postar(String descricao, Mira user, String img){
		
		EntityManager em = emf.createEntityManager();
		
		try {
			Post post = new Post(descricao,user,img);
			em.getTransaction().begin();
			em.persist(post);
			em.getTransaction().commit();
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			em.close();
		}
		
	}
	
	public ArrayList<Post> puxarPosts() {
		
		ArrayList<Post> posts = new ArrayList<>();
		EntityManager em = emf.createEntityManager();
		
		try {
			Query query = em.createQuery("from " + Post.class.getName());
			posts = (ArrayList<Post>) query.getResultList();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			em.close();
		}
		
		return posts;
	
	}
	
	public ArrayList<Post> puxarPostsUser(Mira u) {
		
		ArrayList<Post> posts = new ArrayList<>();
		EntityManager em = emf.createEntityManager();
		
		try {
			
			Query query = em.createQuery("FROM Post p WHERE p.user = :u ORDER BY p.id DESC");
	        query.setParameter("u", u);
			posts = (ArrayList<Post>) query.getResultList();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			em.close();
		}
		
		return posts;
	
	}
	
	public Mira buscarUsuarioPorNome(String usuario) {
	    EntityManager em = emf.createEntityManager();
	    Mira u = null;
	    try {
	        Query query = em.createQuery("FROM Mira m WHERE m.usuario = :usuario");
	        query.setParameter("usuario", usuario);
	        u = (Mira) query.getSingleResult();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        em.close();
	    }
	    return u;
	}
	
	public String puxarImagePerfilUser(String usuario) {
		
		EntityManager em = emf.createEntityManager();
		String imagemPerfil = null;
		
		try {
			
	        Query query = em.createQuery("SELECT u.imgUser FROM Mira  u WHERE u.usuario = :usuario");
			query.setParameter("usuario", usuario);
			
	        imagemPerfil = (String) query.getSingleResult();
	        
	        System.out.println("DAO - Imagem encontrada: " + imagemPerfil);


			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			em.close();
		}
		
		return imagemPerfil;
	
	}
	
	public Boolean seguir(Mira seguidor, Mira seguindo) {

	EntityManager em = emf.createEntityManager();
		
		try {
			
			em.getTransaction().begin();
			
		    // Garante que estamos trabalhando com entidades gerenciadas (do banco)
	        Mira seguidorBD = em.find(Mira.class, seguidor.getUsuario());
	        Mira seguindoBD = em.find(Mira.class, seguindo.getUsuario());

	        if (seguidorBD == null || seguindoBD == null) {
	            System.out.println("Usuário não encontrado.");
	            return false;
	        }
	        
	        

	        // adiciona relação: seguidor segue seguindo
	        seguidorBD.seguir(seguindoBD);
	        
	        em.merge(seguidorBD);
	        em.merge(seguindoBD);

	        em.flush();
			em.getTransaction().commit();
			return true;
			
		}
		catch (Exception e) {
			
			e.printStackTrace();
			return false;
			
		}
		finally {
			
			em.close();
			
		}
		
	}
	
	public Boolean deixarSeguir(Mira seguidor, Mira seguindo) {

		EntityManager em = emf.createEntityManager();
			
			try {
				
				em.getTransaction().begin();
				
		        Mira seguidorBD = em.find(Mira.class, seguidor.getUsuario());
		        Mira seguindoBD = em.find(Mira.class, seguindo.getUsuario());

		        if (seguidorBD == null || seguindoBD == null) {
		            System.out.println("Usuário não encontrado.");
		            return false;
		        }

		        seguidorBD.deixarDeseguir(seguindoBD);

		        em.flush();
				em.getTransaction().commit();
				return true;
				
			}
			catch (Exception e) {
				
				e.printStackTrace();
				return false;
				
			}
			finally {
				
				em.close();
				
			}
			
		}
	
	public Boolean curtir(Post postCurtido, Mira user_like) {

	    EntityManager em = emf.createEntityManager();

	    try {

	        em.getTransaction().begin();

	        // Carrega entidades gerenciadas
	        Mira user_likeBD = em.find(Mira.class, user_like.getUsuario());
	        Post postCurtidoBD = em.find(Post.class, postCurtido.getId());

	        if (user_likeBD == null || postCurtidoBD == null) {
	            System.out.println("Usuário ou Post não encontrado.");
	            return false;
	        }

	        // ✅ Chama o método certo (em Mira)
	        user_likeBD.curtir(postCurtidoBD);

	        // ✅ Merge no dono da relação
	        em.merge(user_likeBD);

	        em.getTransaction().commit();
	        return true;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;

	    } finally {
	        em.close();
	    }
	}
	
	
	public Boolean descurtir(Post postCurtido, Mira user_like) {

	    EntityManager em = emf.createEntityManager();
	    System.out.println("aqui");
	    try {

	        em.getTransaction().begin();

	        Mira user_likeBD = em.find(Mira.class, user_like.getUsuario());
	        Post postCurtidoBD = em.find(Post.class, postCurtido.getId());

	        if (user_likeBD == null || postCurtidoBD == null) {
	            System.out.println("Usuário ou Post não encontrado.");
	            return false;
	        }

	        user_likeBD.descurtir(postCurtidoBD);

	        em.getTransaction().commit();
	        return true;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;

	    } finally {
	        em.close();
	    }
	}


	public Post buscarPostPorId(int id) {
	    EntityManager em = emf.createEntityManager();
	    Post p = null;
	    try {
	        Query query = em.createQuery("SELECT p FROM Post p WHERE p.id = :id");
	        query.setParameter("id", id);
	        p = (Post) query.getSingleResult();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {	
	        em.close();
	    }
	    return p;
	}
	
//------------------------------------------------
	
public boolean cadastrarAnimal (String nomeComum, String nomeCientifico, String habitat, String local, String risco, String curiosidade, String image, int populacao) {
		
		EntityManager em = emf.createEntityManager();
		
		try {
			AnimaisRisco animal = new AnimaisRisco(nomeComum, nomeCientifico, habitat, local, risco, curiosidade, image, populacao);
			em.getTransaction().begin();
			em.persist(animal);
			em.getTransaction().commit();
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally {
			em.close();
		}
		
	}

public ArrayList<AnimaisRisco> puxarCards(String risco) {
		
		ArrayList<AnimaisRisco> cards = new ArrayList<>();
		EntityManager em = emf.createEntityManager();
		
		try {
			Query query = em.createQuery("from " + AnimaisRisco.class.getName() + " WHERE risco = :riscoParam");
			query.setParameter("riscoParam", risco);
			cards = (ArrayList<AnimaisRisco>) query.getResultList();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			em.close();
		}
		
		return cards;
	
	}
	
	public ArrayList<AnimaisRisco> puxarCardsUser(Mira u) {
		
		ArrayList<AnimaisRisco> cards = new ArrayList<>();
		EntityManager em = emf.createEntityManager();
		
		try {
			Query query = em.createQuery("from " + AnimaisRisco.class.getName() + " WHERE user = :u");
			query.setParameter(":u", u);
			cards = (ArrayList<AnimaisRisco>) query.getResultList();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			em.close();
		}
		
		return cards;
	
	}
	
}
