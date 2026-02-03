package model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class AnimaisRisco {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	String nomeComum, nomeCientifico, habitat, local, risco, curiosidade, image;
	int populacao;
	
	
	public AnimaisRisco() {}
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNomeComum() {
		return nomeComum;
	}


	public void setNomeComum(String nomeComum) {
		this.nomeComum = nomeComum;
	}


	public String getNomeCientifico() {
		return nomeCientifico;
	}


	public void setNomeCientifico(String nomeCientifico) {
		this.nomeCientifico = nomeCientifico;
	}


	public String getHabitat() {
		return habitat;
	}


	public void setHabitat(String habitat) {
		this.habitat = habitat;
	}


	public String getLocal() {
		return local;
	}


	public void setLocal(String local) {
		this.local = local;
	}


	public String getRisco() {
		return risco;
	}


	public void setRisco(String risco) {
		this.risco = risco;
	}


	public String getCuriosidade() {
		return curiosidade;
	}


	public void setCuriosidade(String curiosidade) {
		this.curiosidade = curiosidade;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public int getPopulacao() {
		return populacao;
	}


	public void setPopulacao(int populacao) {
		this.populacao = populacao;
	}


	public AnimaisRisco(String nomeComum, String nomeCientifico, String habitat, String local, String risco,
			String curiosidade, String image, int populacao) {
		super();
		this.nomeComum = nomeComum;
		this.nomeCientifico = nomeCientifico;
		this.habitat = habitat;
		this.local = local;
		this.risco = risco;
		this.curiosidade = curiosidade;
		this.image = image;
		this.populacao = populacao;
	}


	public AnimaisRisco(int id, String nomeComum, String nomeCientifico, String habitat, String local, String risco,
			String curiosidade, String image, int populacao) {
		super();
		this.id = id;
		this.nomeComum = nomeComum;
		this.nomeCientifico = nomeCientifico;
		this.habitat = habitat;
		this.local = local;
		this.risco = risco;
		this.curiosidade = curiosidade;
		this.image = image;
		this.populacao = populacao;
	}
	
	
	
	
}
	