package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Objects;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.AnimaisRisco;
import model.Mira;
import model.MiraDAO;
import model.Post;

/**
 * Servlet implementation class miraController
 * 
 * 
 */
@WebServlet("/MiraController")
@MultipartConfig
public class MiraController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MiraDAO mDAO;
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("banco-MIRA");

	@Override
	public void init() throws ServletException {
		mDAO = new MiraDAO(emf);
	}

	public MiraController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String operacao = request.getParameter("operacao");
		operacao = operacao.toLowerCase();

		switch (operacao) {
		case "forum":

			redirecionarForum(request, response);
			break;
			
		case "adm":
			
			redirecionarAdm(request, response);
			break;
			
		case "globo":
			
			redirecionarGlobo(request, response);
			break;
			
		case "index":
			
			redirecionarIndex(request, response);
			break;
			
		case "animaisrisco":
			
			redirecionarAnimaisRisco(request, response);
			break;
			
		case "poluicao":
			
			redirecionarPoluicao(request, response);
			break;
			
		case "ongs":
			
			redirecionarOngs(request, response);
			break;
			
		case "publicarposts": 
			
			redirecionarCriarPosts(request, response);
			break;
			
		case "perfil":
			
			redirecionarPerfil(request, response);
			break;
			
		case "seguirusuario":
			seguirUsuario(request, response);
			
			break;
		case "sair":
			deslogarUsuario(request, response);
			break;
			
		case "deixardeseguir":
			deixarSeguir(request, response);
			break;
			
		case "curtir":
			curtir(request, response);
			break;
		case "descurtir":
			descurtir(request, response);
			break;
			
		default:
			System.out.println("Erro! operacao falhou");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String operacao = request.getParameter("operacao");

		switch (operacao) {

		case "criar":

			cadastrarUsuario(request, response);
			break;
			
		case "cadastrarAnimal":

			cadastrarAnimal(request, response);
			break;

		case "logar":

			logarUsuario(request,response);
			break;
			
		case "postar":
			
			postar(request,response);
			
		break;

//		case "redefinir":
//			enviarEmail(request,response);
//			break;

		default:
			
			System.out.println("Erro! operacao falhou");

		}

	}
		
	

	private void cadastrarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		String email = request.getParameter("email");
		String imageUser = request.getParameter("ftPerfil");

		Mira verificar = mDAO.verificarUsuario(email);

		if (verificar == null) {

			boolean inseriu = mDAO.criarUsuario(usuario, senha, email, imageUser);

			request.setAttribute("status", inseriu);
			RequestDispatcher d = request.getRequestDispatcher("/login.html");
			d.forward(request, response);

		} else {

			request.setAttribute("status", false);
			RequestDispatcher d = request.getRequestDispatcher("/cadastro.html");
			d.forward(request, response);

		}

	}

	
	  
	private void logarUsuario(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		String usuario = request.getParameter("usuario");

		String senha = request.getParameter("senha");



		Mira u = mDAO.verificarLogin(usuario);

		RequestDispatcher d;

		if (u != null && u.getSenha().equals(senha)) {

			HttpSession session = request.getSession();

			session.setAttribute("usuario", u);

			request.setAttribute("status", true);

			request.setAttribute("usuario", usuario);
			request.setAttribute("senha", senha);

			d = request.getRequestDispatcher("/index.jsp");

			d.forward(request, response);

		}else if ("adminwinx".equals(usuario) && "winx2024".equals(senha)) {
			
			HttpSession session = request.getSession();

			session.setAttribute("usuario", u);
			
			request.setAttribute("status", true);

			request.setAttribute("usuarioadm", usuario);
			
		}else {

			request.setAttribute("erro", true);

			d = request.getRequestDispatcher("/login.jsp");

			d.forward(request, response);

		}

	}
	 
	private void redirecionarForum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		
	    String imagemPerfil = mDAO.puxarImagePerfilUser(u.getUsuario());

		
	    if(imagemPerfil != null && !imagemPerfil.trim().isEmpty() && !imagemPerfil.equalsIgnoreCase("null")) {
	        request.setAttribute("imagemPerfil", imagemPerfil);
	        System.out.println("Imagem do perfil encontrada: " + imagemPerfil);
	    } else {
	        // Usa imagem padrão
	        request.setAttribute("imagemPerfil", "imagens/icon-img.png");
	        System.out.println("Usando imagem padrão do perfil");
	    }
		

			ArrayList<Post> posts = mDAO.puxarPosts();
			
			
			if( u == null) {
				
				request.setAttribute("status", false);	
				
			}else {
				request.setAttribute("senha", u.getSenha());
				request.setAttribute("usuario", u.getUsuario()); 
			    request.setAttribute("status", true);	
			}	
			request.setAttribute("posts", posts);
			d = request.getRequestDispatcher("/feedSocial.jsp");
			d.forward(request, response);

		

	}
	
	private void redirecionarGlobo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		
		if( u == null) {
			request.setAttribute("status", false);	
		}else {
			request.setAttribute("senha", u.getSenha());
			request.setAttribute("usuario", u.getUsuario()); 
		    request.setAttribute("status", true);	
		}		

		d = request.getRequestDispatcher("/globo.jsp");
		d.forward(request, response);

	}
	
	private void redirecionarAnimaisRisco(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		HttpSession session = request.getSession();
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		
		if( u == null) {
			request.setAttribute("status", false);	
		}else {
			request.setAttribute("senha", u.getSenha());
			request.setAttribute("usuario", u.getUsuario()); 
		    request.setAttribute("status", true);	
		}	
				
		ArrayList<AnimaisRisco> animaisMuitoRisco = mDAO.puxarCards("muitoRisco");
        ArrayList<AnimaisRisco> animaisPoucoRisco = mDAO.puxarCards("poucoRisco");
        

        
        request.setAttribute("animaisMuitoRisco", animaisMuitoRisco);
        request.setAttribute("animaisPoucoRisco", animaisPoucoRisco);		
			

		d = request.getRequestDispatcher("/animaisRisco.jsp");
		d.forward(request, response);

	}
	
	private void redirecionarPoluicao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		
		if( u == null) {
			request.setAttribute("status", false);	
		}else {
			request.setAttribute("senha", u.getSenha());
			request.setAttribute("usuario", u.getUsuario()); 
		    request.setAttribute("status", true);	
		}			

		d = request.getRequestDispatcher("/poluicaoMarinha.jsp");
		d.forward(request, response);

	}
	
	private void redirecionarOngs(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		
		
		if( u == null) {
			request.setAttribute("status", false);	
		}else {
			request.setAttribute("senha", u.getSenha());
			request.setAttribute("usuario", u.getUsuario()); 
		    request.setAttribute("status", true);	
		}			

		d = request.getRequestDispatcher("/ongs.jsp");
		d.forward(request, response);

	}
	
	private void redirecionarIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		
		if( u == null) {
			request.setAttribute("status", false);	
			
		}else {
			request.setAttribute("senha", u.getSenha());
			request.setAttribute("usuario", u.getUsuario()); 
		    request.setAttribute("status", true);	
		}		

		d = request.getRequestDispatcher("/index.jsp");
		d.forward(request, response);

	}
	
	private void redirecionarCriarPosts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		if( u == null) {
			request.setAttribute("status", false);	
		}else {
			request.setAttribute("senha", u.getSenha());
			request.setAttribute("usuario", u.getUsuario()); 
		    request.setAttribute("status", true);	
		}		

		d = request.getRequestDispatcher("/publicarPosts.jsp");
		d.forward(request, response);

	}
	
	private void redirecionarPerfil(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		HttpSession session = request.getSession();
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		
	    Mira usuarioLogado = (Mira) session.getAttribute("usuario");

	    String usuarioPerfil = request.getParameter("usuario");

	    Mira perfil = null;
	    if (usuarioPerfil != null && !usuarioPerfil.isEmpty()) {
	        perfil = mDAO.buscarUsuarioPorNome(usuarioPerfil);
	    } else {
	        perfil = usuarioLogado;
	    }

	    String imagemPerfil = mDAO.puxarImagePerfilUser(perfil.getUsuario());

		
	    if(imagemPerfil != null && !imagemPerfil.trim().isEmpty() && !imagemPerfil.equalsIgnoreCase("null")) {
	        request.setAttribute("imagemPerfil", imagemPerfil);
	        System.out.println("Imagem do perfil encontrada: " + imagemPerfil);
	    } else {
	        // Usa imagem padrão
	        request.setAttribute("imagemPerfil", "imagens/icon-img.png");
	        System.out.println("Usando imagem padrão do perfil");
	    }
	    
	    ArrayList<Post> posts = mDAO.puxarPostsUser(perfil);
	    
		request.setAttribute("posts", posts);
		
		request.setAttribute("perfilNome", perfil.getUsuario());

		
		request.setAttribute("seguidores", perfil.getSeguidores());
		request.setAttribute("seguindo", perfil.getSeguindo());
		
		request.setAttribute("senha", u.getSenha());
		request.setAttribute("usuarioPerfil", usuarioPerfil);
		request.setAttribute("usuario", u.getUsuario()); // Objeto Mira completo
	    request.setAttribute("status", true);		

		d = request.getRequestDispatcher("/perfilUser.jsp");
		d.forward(request, response);

	}
	
	
	private void redirecionarAdm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Mira u = (Mira) session.getAttribute("usuario");
		RequestDispatcher d;
		request.setAttribute("senha", u.getSenha());
		request.setAttribute("usuario", u.getUsuario()); // Objeto Mira completo
	    request.setAttribute("status", true);		

		d = request.getRequestDispatcher("/admPage.jsp");
		d.forward(request, response);

		

	}
	private void cadastrarAnimal(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
	    Mira u = (Mira) session.getAttribute("usuario");
		
		
		String nomeComum = request.getParameter("nomeComum");
		String nomeCientifico = request.getParameter("nomeCientifico");
		String habitat = request.getParameter("habitat");
		String local = request.getParameter("local");
		String risco = request.getParameter("risco");
		String curiosidade = request.getParameter("curiosidade");
		Part image = request.getPart("imageAnimal");
		int populacao = Integer.parseInt(request.getParameter("populacao"));
		


	    if (image == null || image.getSize() == 0) {
	        System.out.println("Nenhum arquivo enviado!");
	        return;
	    }

	    // Nome original e extensão
	    String nomeOriginal = Paths.get(image.getSubmittedFileName()).getFileName().toString();
	    String extensao = "";
	    int i = nomeOriginal.lastIndexOf('.');
	    if (i > 0) {
	        extensao = nomeOriginal.substring(i); // inclui o ponto
	    }
	    

	    
	    ArrayList<AnimaisRisco> animais = mDAO.puxarCardsUser(u);
	    
	    
	    if(!animais.isEmpty()) {
	    	AnimaisRisco ultimo = animais.getLast();
	    }
	    String novoNome = "animal_" + System.currentTimeMillis() + extensao;
	    

	    // Caminho absoluto da pasta /uploads
	    String caminhoUpload = "C:\\Users\\Home\\Downloads\\ESCOLA\\Tcc\\tcc-back-2\\src\\main\\webapp\\uploadsAnimaisRisco";

	    // Cria pasta se não existir
	    File pasta = new File(caminhoUpload);
	    if (!pasta.exists()) {
	        pasta.mkdirs();
	    }

	    // Caminho final do arquivo
	    File arquivoDestino = new File(caminhoUpload, novoNome);

	    // Lê e grava manualmente
	    try (InputStream input = image.getInputStream()) {
	        Files.copy(input, arquivoDestino.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
	    }

	    System.out.println("Descrição: " + nomeComum);
	    System.out.println("Arquivo salvo em: " + arquivoDestino.getAbsolutePath());
	    String caminhoUploadSalvar = "uploadsAnimaisRisco/" + novoNome; 
	        

	
		boolean inseriu = mDAO.cadastrarAnimal(nomeComum, nomeCientifico, habitat, local, risco, curiosidade, caminhoUploadSalvar, populacao);

		request.setAttribute("status", inseriu);
		RequestDispatcher d = request.getRequestDispatcher("/cadastrado.jsp");
		d.forward(request, response);

	}
	
	
	
	private void postar(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    HttpSession session = request.getSession();
	    Mira u = (Mira) session.getAttribute("usuario");
	    String descricao = request.getParameter("descricao");
	    int likes;
	    
	    if(Objects.isNull(request.getParameter("likes"))) {
	    	likes = 0;
	    }else {
	    	likes  = Integer.parseInt(request.getParameter("likes"));
	    }
	    
	    

	    Part arquivo = request.getPart("ftPost");

	    if (arquivo == null || arquivo.getSize() == 0) {
	        System.out.println("Nenhum arquivo enviado!");
	        return;
	    }
	    
	    String nomeOriginal = Paths.get(arquivo.getSubmittedFileName()).getFileName().toString();
	    String extensao = "";
	    int i = nomeOriginal.lastIndexOf('.');
	    if (i > 0) {
	        extensao = nomeOriginal.substring(i); // inclui o ponto
	    }
	    

	    
	    ArrayList<Post> posts = mDAO.puxarPostsUser(u);	    
	    

	    String novoNome = "Post_" + System.currentTimeMillis() + extensao;
	    

	    // Caminho absoluto da pasta /uploads
	    String caminhoUpload = "C:\\Users\\Home\\Downloads\\ESCOLA\\Tcc\\tcc-back-2\\src\\main\\webapp\\uploads";

	    // Cria pasta se não existir
	    File pasta = new File(caminhoUpload);
	    if (!pasta.exists()) {
	        pasta.mkdirs();
	    }
	    
	    

	    // Caminho final do arquivo
	    File arquivoDestino = new File(caminhoUpload, novoNome);

	    // Lê e grava manualmente
	    try (InputStream input = arquivo.getInputStream()) {
	        Files.copy(input, arquivoDestino.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
	    }

	    System.out.println("Descrição: " + descricao);
	    System.out.println("Arquivo salvo em: " + arquivoDestino.getAbsolutePath());
	    String caminhoUploadSalvar = "uploads/" + novoNome; 
	    
	    boolean postado = mDAO.postar(descricao, u, caminhoUploadSalvar);
	    
	   
		if( u == null) {
			request.setAttribute("status", false);	
			
			
		}else {
			request.setAttribute("senha", u.getSenha());
			request.setAttribute("usuario", u.getUsuario()); 
		    request.setAttribute("status", true);	
		    response.sendRedirect("MiraController?operacao=forum&usuario=" + u.getUsuario());
		    
		}		
		
	}
	
	private void seguirUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Mira userSeguidor = (Mira) session.getAttribute("usuario");
		
		String usuarioPerfil = request.getParameter("usuarioSeguir");

		Mira userSeguindo = mDAO.buscarUsuarioPorNome(usuarioPerfil);

		boolean seguir = mDAO.seguir(userSeguidor, userSeguindo);

		response.sendRedirect("MiraController?operacao=perfil&usuario=" + usuarioPerfil);

	}
	
	private void deslogarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		RequestDispatcher d;

		d = request.getRequestDispatcher("/index.jsp");
		d.forward(request, response);
		
	}
	
	private void deixarSeguir(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		Mira userSeguidor = (Mira) session.getAttribute("usuario");
		
		String usuarioPerfil = request.getParameter("usuarioSeguir");

		Mira userSeguindo = mDAO.buscarUsuarioPorNome(usuarioPerfil);

		boolean deixarSeguir = mDAO.deixarSeguir(userSeguidor, userSeguindo);

		response.sendRedirect("MiraController?operacao=perfil&usuario=" + usuarioPerfil);
		
	}
	
	private void curtir(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Mira userCurtiu = (Mira) session.getAttribute("usuario");
		
		int postId = Integer.parseInt(request.getParameter("postId"));
		String usuarioPerfil = request.getParameter("usuarioPerfil");
		Post postCurtido = mDAO.buscarPostPorId(postId);
		
		int pagina = Integer.parseInt(request.getParameter("pagina"));
		
		boolean curtir = mDAO.curtir(postCurtido, userCurtiu);
		
		
		if(pagina==2) {
			response.sendRedirect("MiraController?operacao=forum&usuario=" + usuarioPerfil);
		}else {
			response.sendRedirect("MiraController?operacao=perfil&usuario=" + usuarioPerfil);
		}


}
	
	private void descurtir(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Mira userCurtiu = (Mira) session.getAttribute("usuario");
		
		
		
		int postId = Integer.parseInt(request.getParameter("postId"));
		
		int pagina = Integer.parseInt(request.getParameter("pagina"));

		String usuarioPerfil = request.getParameter("usuarioPerfil");
		Post postCurtido = mDAO.buscarPostPorId(postId);

		boolean descurtir = mDAO.descurtir(postCurtido, userCurtiu);
		
		System.out.println("aqui1" + postId);
		
		if(pagina==2) {
			response.sendRedirect("MiraController?operacao=forum&usuario=" + usuarioPerfil);
		}else {
			response.sendRedirect("MiraController?operacao=perfil&usuario=" + usuarioPerfil);
		}


}


	
}
