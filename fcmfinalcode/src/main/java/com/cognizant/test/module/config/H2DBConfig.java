package com.cognizant.test.module.config;




import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef = "h2EntityManagerFactory",
        transactionManagerRef = "h2TransactionManager",
        basePackages = {"com.cognizant.test.module.repo"}
)
public class H2DBConfig {

    
    @Bean(name = "h2DataSource")
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource h2DataSource() {
        return DataSourceBuilder.create().build();
    }

    
    @Bean(name = "h2EntityManagerFactory")
    public LocalContainerEntityManagerFactoryBean
    entityManagerFactory(
            EntityManagerFactoryBuilder builder,
            @Qualifier("h2DataSource") DataSource dataSource
    ) {
    	
    	Map<String, Object>properties = new HashMap<String, Object>();
    	properties.put("hibernate.hbm2ddl.auto", "update");
    	properties.put("hibernate.dialect","org.hibernate.dialect.H2Dialect" );
        return builder
                .dataSource(dataSource).properties(properties)
                .packages("com.cognizant.test.module.data")
                .persistenceUnit("ModuleList").persistenceUnit("Project").persistenceUnit("UserDetail")
                .build();
    }

   
    @Bean(name = "h2TransactionManager")
    public PlatformTransactionManager h2TransactionManager(
            @Qualifier("h2EntityManagerFactory") EntityManagerFactory
                    h2EntityManagerFactory
    ) {
        return new JpaTransactionManager(h2EntityManagerFactory);
    }
}
