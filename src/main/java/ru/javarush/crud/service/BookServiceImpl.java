package ru.javarush.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import ru.javarush.crud.dao.GenericDao;
import ru.javarush.crud.dao.BookDao;
import ru.javarush.crud.model.Book;

import java.util.List;


@Service
public class BookServiceImpl implements BookService {

    private BookDao bookDao;
    private GenericDao<Book, Integer> genericDao;

    public BookServiceImpl() {
    }
    @Autowired
    public BookServiceImpl(@Qualifier("bookDaoImpl") GenericDao<Book, Integer> genericDao) {
        this.genericDao = genericDao;
        this.bookDao = (BookDao)genericDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Book> getByTitle(String title) {
        return bookDao.findByTitle(title);
    }

    @Override
    public List<Book> getPageList(Integer offset, Integer maxResults) {
        return bookDao.getPageList(offset, maxResults);
    }

    @Override
    public Long count() {
        return bookDao.count();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Book> getAll() {
        return genericDao.getAll();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public Book get(Integer id) {
        return genericDao.find(id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void add(Book entity) {
        genericDao.persist(entity);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void update(Book entity) {
        genericDao.update(entity);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(Book entity) {
        genericDao.remove(entity);
    }
}
