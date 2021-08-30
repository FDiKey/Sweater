package com.example.sweater.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {

    @Value("${spring.mail.host}")
    public String host;

    @Value("${spring.mail.username}")
    public String username;

    @Value("${spring.mail.password}")
    public String password;

    @Value("${spring.mail.port}")
    public int port;

    @Value("${spring.mail.protocol}")
    public String protocol;

    @Value("${mail.debug}")
    public String debug;

    @Bean
    public JavaMailSender getMailSender(){
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        mailSender.setHost(host);
        mailSender.setUsername(username);
        mailSender.setPassword(password);
        mailSender.setPort(port);
        mailSender.setProtocol(protocol);

        Properties property = new Properties();
        property.setProperty("mail.transport.protocol", protocol);
        property.setProperty("mail.debug", debug);
        property.setProperty("mail.smtp.starttls.enable", "true");

        mailSender.setJavaMailProperties(property);
        return mailSender;
    }
}
