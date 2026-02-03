package model;

import java.util.List;
import java.util.Set;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.PreRemove;

@Entity
public class Mira {
	
	@Id
	private String usuario;
	private String senha;
	private String email;
	private String imgUser;

	
	@ManyToMany(mappedBy="seguindo", fetch=FetchType.EAGER)
	private List<Mira> seguidores;

	// lado dono da relação
	@ManyToMany(fetch=FetchType.EAGER) 
	@JoinTable(name = "segue" , joinColumns = @JoinColumn(name = "login_seguidor"), inverseJoinColumns = @JoinColumn(name = "login_segue"))
	private List<Mira> seguindo;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
	    name = "likes",
	    joinColumns = @JoinColumn(name = "login_seguidor"),
	    inverseJoinColumns = @JoinColumn(name = "post_id", referencedColumnName = "id")
	)
	private Set<Post> postsCurtidos;

	
	@PreRemove
	private void removerRelacionamentos() {

	    // remover este usuário da lista de seguidores de quem ele segue
	    for (Mira seguido : this.seguindo) {
	        seguido.getSeguidores().remove(this);
	    }

	    // remover este usuário da lista de quem segue ele
	    for (Mira seguidor : this.seguidores) {
	        seguidor.getSeguindo().remove(this);
	    }

	    // ✅ remover curtidas deste usuário em posts
	    for (Post post : this.postsCurtidos) {
	        post.getCurtidoPor().remove(this);
	    }

	    this.postsCurtidos.clear(); // ✅ limpa tabela likes

	    // limpar listas locais
	    this.seguindo.clear();
	    this.seguidores.clear();
	}
	
	public Mira(String usuario, String senha, String email, String imgUser, List<Mira> seguidores, List<Mira> seguindo) {
		super();
		this.usuario = usuario;
		this.senha = senha;
		this.email = email;
		this.seguidores = seguidores;
		this.seguindo = seguindo;
		this.imgUser = imgUser;
	}
	public Mira(String usuario, String senha, String email, String imgUser) {
		super();
		this.usuario = usuario;
		this.senha = senha;
		this.email = email;
		this.imgUser = imgUser;
	}	
	
	public Mira() {
		super();
	}
	
	
	public String getImgUser() {
		return imgUser;
	}
	
	public void setImgUser(String imgUser) {
		this.imgUser = imgUser;
	}
	
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Mira> getSeguidores() {
		return seguidores;
	}

	public void setSeguidores(List<Mira> seguidores) {
		this.seguidores = seguidores;
	}

	public List<Mira> getSeguindo() {
		return seguindo;
	}

	public void setSeguindo(List<Mira> seguindo) {
		this.seguindo = seguindo;
	}
	
	public Set<Post> getPostsCurtidos() {
	    return postsCurtidos;
	}

	public void setPostsCurtidos(Set<Post> postsCurtidos) {
	    this.postsCurtidos = postsCurtidos;
	}
	
	 public void seguir(Mira outraPessoa) {
	        this.seguindo.add(outraPessoa);
	        outraPessoa.getSeguidores().add(this);
	    }
	 public void deixarDeseguir(Mira outraPessoa) {
		 
	        this.seguindo.remove(outraPessoa);
	        outraPessoa.getSeguidores().remove(this);
	    }
	 
	 public void curtir(Post post) { // ALTERADO
		    this.postsCurtidos.add(post);
		    post.getCurtidoPor().add(this);
		}

		public void descurtir(Post post) { // ALTERADO
		    this.postsCurtidos.remove(post);
		    post.getCurtidoPor().remove(this);
		}

	
}
