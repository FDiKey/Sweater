package com.example.sweater.Model;

import javax.persistence.*;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    private String text;
    private String tag;
    private String fileName;



    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public Message(){}

    public Message(String text, String tag, User user) {
        this.text = text;
        this.tag = tag;
        this.author = user;

    }

    public String getAuthorName()
    {
        return author != null ? author.getUsername() : "<none>";
    }
    public Message(String text) {
        this.text = text;
        this.tag = "none";
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Long getId() {
        return Id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
