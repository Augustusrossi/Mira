package model;

import java.util.Set;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PreRemove;

@Entity
public class Post  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String descricao;

    @ManyToOne(optional = false)
    private Mira user;

    private String img;

    // Agora: Um Post pode ser curtido por vários usuários
    @ManyToMany(mappedBy = "postsCurtidos", fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Mira> curtidoPor; // <-- ALTERADO
    
    @PreRemove
    private void removerCurtidas() {
        for (Mira usuario : this.curtidoPor) {
            usuario.getPostsCurtidos().remove(this);
        }
        this.curtidoPor.clear(); // ✅ limpa tabela likes
    }


    public Post() {
        super();
    }

    public Post(String descricao, Mira user, String img) {
        this.descricao = descricao;
        this.user = user;
        this.img = img;
    }

    public Post(int id, String descricao, Mira user, String img, Set<Mira> curtidoPor) {
        this.id = id;
        this.descricao = descricao;
        this.user = user;
        this.img = img;
        this.curtidoPor = curtidoPor;
    }

    // Getters e Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Mira getUser() {
        return user;
    }

    public void setUser(Mira user) {
        this.user = user;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Set<Mira> getCurtidoPor() { 
        return curtidoPor;
    }

    public void setCurtidoPor(Set<Mira> curtidoPor) {
        this.curtidoPor = curtidoPor;
    }
    
    
}
