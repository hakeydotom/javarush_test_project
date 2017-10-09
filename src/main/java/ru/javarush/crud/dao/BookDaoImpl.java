package ru.javarush.crud.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ru.javarush.crud.model.Book;

import java.util.List;

@Repository
@Transactional
public class BookDaoImpl extends GenericDaoImpl<Book, Integer> implements BookDao {

    @Override
    public List<Book>  findByTitle(String title) {
        List<Book> books = null;
        Criteria criteria = currentSession().createCriteria(Book.class, "book");
        criteria.add(Restrictions.eq("book.title", title));
        books = (List<Book> )criteria.list();
        return books;
    }

    @Override
    @SuppressWarnings("unchecked")
    @Transactional
    public List<Book> getPageList(Integer offset, Integer maxResults){
        return currentSession()
                .createCriteria(Book.class)
                .setFirstResult(offset!=null?offset:0)
                .setMaxResults(maxResults!=null?maxResults:10)
                .list();
    }

    public Long count(){
        return (Long)currentSession()
                .createCriteria(Book.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();
    }
}
