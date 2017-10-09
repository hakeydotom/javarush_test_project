package ru.javarush.crud.model;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table
public class Book implements Serializable {

    private static final long serialVersionUID = 2280347863244902719L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(length = 100)
    private String title;

    private String description;

    private String author;

    private String isbn;

    private int printYear;

    private boolean readedAlready;


    public Book() {
    }



    public Book(Integer id, String title, String description, String author, String isbn, int printYear, boolean readedAlready) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.author = author;
        this.isbn = isbn;
        this.printYear = printYear;
        this.readedAlready = readedAlready;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getPrintYear() {
        return printYear;
    }

    public void setPrintYear(int printYear) {
        this.printYear = printYear;
    }

    public boolean isReadedAlready() {
        return readedAlready;
    }

    public void setReadedAlready(boolean readedAlready) {
        this.readedAlready = readedAlready;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description'=" + description + '\'' +
                ", author='" + author + '\'' +
                ", isbn='" + isbn + '\'' +
                ", printYear=" + printYear +
                ", readedAlready=" + readedAlready +
                '}';
    }
}
