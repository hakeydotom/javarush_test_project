package ru.javarush.crud.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.javarush.crud.model.Book;
import ru.javarush.crud.service.BookService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class BookController {

    @Autowired
    private BookService bookService;


    @RequestMapping(value = "/books")
    public String getBooks(Model model, Integer offset, Integer maxResults) {
        model.addAttribute("books", bookService.getPageList(offset, maxResults));
        model.addAttribute("count", bookService.count());
        model.addAttribute("offset", offset);
        return "/books";
    }

    @RequestMapping(value = {"/addBook"}, method = RequestMethod.GET)
    public String addBookForm(Model model) {
         model.addAttribute("book", new Book());
        return "/add-book";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book,
                             BindingResult result, HttpServletRequest request) {

        bookService.add(book);

        return "redirect:/books";
    }

    @RequestMapping(value = {"/books/edit"}, method = RequestMethod.POST)
    public String editBookForm(@RequestParam(value="bookEdit", required=true) Integer id,
                               Model model) {
        Book book = bookService.get(id);
        model.addAttribute("bookEdit", book);
        return "edit-book";
    }


    @RequestMapping(value = "/editBook", method = RequestMethod.POST)
    public String editBook(@ModelAttribute("bookEdit") Book bookEdit,
                           BindingResult result, HttpServletRequest request) {
        Integer bookId =  Integer.parseInt(request.getParameter("OldBookId"));
        Book book = bookService.get(bookId);
        book.setTitle(bookEdit.getTitle());
        book.setDescription(bookEdit.getDescription());
        book.setPrintYear(bookEdit.getPrintYear());
        book.setIsbn(bookEdit.getIsbn());
        //по бизнес-логике нельзя менять поле "прочитано", оно становится "false"
        //book.setReadedAlready(bookEdit.isReadedAlready());
         book.setReadedAlready(false);

        bookService.update(book);
        //возврат на страницу со смещением к отредактированной книге
        return "redirect:/books";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam(value="bookDeleted", required=true) Integer id,
                         Model model) {

        Book book = bookService.get(id);
        bookService.delete(book);

        return "redirect:/books";
    }

    @RequestMapping(value = {"/readed"}, method = RequestMethod.POST)
    public String readedBook(@RequestParam(value="bookReaded", required=true) Integer id,
                             Model model) {
        Book book = bookService.get(id);
        book.setReadedAlready(true);
        bookService.update(book);
        //model.addAttribute("bookReaded", book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/books/search", method = RequestMethod.POST)
    public String searchBook(Model model, HttpServletRequest request) {
        List<Book> books = null;
        String result = request.getParameter("search");

        if (result.isEmpty()){
            return "redirect:/books";
        }
        else {
            books = bookService.getByTitle(result);

            if (books.size() != 0) {
                model.addAttribute("searchBooks", books);
                return "/search";
            }
            else {
                request.setAttribute("noResults", true);
                return "/search";
            }
        }

    }
}
