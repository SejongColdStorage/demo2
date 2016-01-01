package com.example.comment;

import com.example.DemoApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=DemoApplication.class)
public class CommentRepositoryTest {

    @Autowired
    CommentRepository repository;

    @Test
    public void commentTest(){
        Comment comment = new Comment();
        comment.setName("aaa");
        comment.setBody("body");
        comment.setDate(new Date());

        repository.save(comment);
        repository.flush();

        List<Comment> all = repository.findAll();
        System.out.println(all);
    }
}