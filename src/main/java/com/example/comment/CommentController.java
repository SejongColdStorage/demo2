package com.example.comment;

import com.thedeanda.lorem.Lorem;
import com.thedeanda.lorem.LoremIpsum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.PostConstruct;
import java.util.Date;

import static org.springframework.data.domain.Sort.Direction.DESC;
import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
public class CommentController {
    @Autowired
    CommentRepository repository;

    // 테스트 용도 데이터 생성
    @PostConstruct
    public void addSampleData() {
        Lorem lorem = LoremIpsum.getInstance();
        for (int idx = 0; idx < 30; idx++)
            repository.save(new Comment(lorem.getName(), lorem.getWords(4, 10), new Date()));
    }

    // /comments?page=1
    @RequestMapping("/comments")
    public String comments(
            Model model,
            @RequestParam(defaultValue = "1") int page) {

        Page<Comment> commentPage = repository.findAll(
                new PageRequest(page - 1, 5, DESC, "id")
        );

        model.addAttribute("totalPageNumber", commentPage.getTotalPages());
        model.addAttribute("currentPageNumber", commentPage.getNumber() + 1);
        model.addAttribute("comments", commentPage.getContent());

        return "comment/list";
    }

    @RequestMapping(value = "/comment/add", method = GET)
    public String viewAddComment(Model model) {
        return "comment/add";
    }

    @RequestMapping(value = "/comment/add", method = POST)
    public String submitAddComment(Comment comment) {
        comment.setDate(new Date());
        repository.save(comment);
        return "redirect:/comments";
    }


    @RequestMapping(value = "/comments/{id}/modify", method = GET)
    public String viewModifyComment(@PathVariable Long id, Model model) {
        model.addAttribute("comment", repository.getOne(id));

        return "comment/modify";
    }

    @RequestMapping(value = "/comments/{id}/modify", method = POST)
    public String submitModifyComment(Comment comment) {
        comment.setDate(new Date());
        repository.save(comment);
        return "redirect:/comments";
    }

    @RequestMapping(value = "/comments/{id}", method = DELETE)
    @ResponseBody
    public ResponseEntity deleteComment(@PathVariable Long id) {
        repository.delete(id);
        return ResponseEntity.ok(true);
    }
}
