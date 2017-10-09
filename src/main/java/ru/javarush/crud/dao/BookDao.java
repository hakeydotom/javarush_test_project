package ru.javarush.crud.dao;

import ru.javarush.crud.model.Book;

import java.util.List;

public interface BookDao extends GenericDao<Book, Integer> {
        public List<Book> findByTitle(String title);
        public List<Book> getPageList(Integer offset, Integer maxResults);
        public Long count();
}
