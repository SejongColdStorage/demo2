package com.example.comment;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

@Data
@Entity
public class Comment {
    @Id
    @GeneratedValue
    private long id;
    private String name;
    private String body;
    private Date date;

    public Comment() {
    }

    public Comment(String name, String body, Date date) {
        this.name = name;
        this.body = body;
        this.date = date;
    }
}
