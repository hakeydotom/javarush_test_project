package ru.javarush.crud.service;

import ru.javarush.crud.model.Book;

import java.util.List;

public interface BookService {
    public List<Book> getByTitle(String name);
    public List<Book> getPageList(Integer offset, Integer maxResults);
    public Long count();
    public List<Book> getAll();
    public Book get(Integer id);
    public void add(Book entity);
    public void update(Book entity);
    public void delete(Book entity);
}
