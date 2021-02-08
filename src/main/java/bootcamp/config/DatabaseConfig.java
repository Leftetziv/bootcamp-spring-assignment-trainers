/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author Leyteris
 * 
 */
@Configuration
@EnableTransactionManagement 
public class DatabaseConfig {
    
    public DataSource datasource(){
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        datasource.setUrl("jdbc:mysql://localhost:3306/assignment_spring?serverTimezone=Europe/Athens");
        datasource.setUsername("root");
        datasource.setPassword("1234");
        
        return datasource;
    }
    
    
    private Properties hibernateProperties() {
        Properties properties = new Properties();
        
        properties.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
        
        properties.put("hibernate.hbm2ddl.auto", "none");
        properties.put("hibernate.show_sql", "true");
        properties.put("hibernate.format_sql", "true");
        
        
        return properties;
    }
    
    @Bean(name = "sessionFactory") 
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        
        sessionFactory.setDataSource(datasource());
        sessionFactory.setHibernateProperties(hibernateProperties());
        sessionFactory.setPackagesToScan("bootcamp.entity");
        
        return sessionFactory;
    }
    
    @Bean
    @Autowired 
    public HibernateTransactionManager transactionManager(SessionFactory s) { //
        
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        
        transactionManager.setSessionFactory(s);
        
        return transactionManager;
    }
    
}
