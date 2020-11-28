package kr.co.ziptoon.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;


@Configuration
@ComponentScan(basePackages = {"kr.co.ziptoon.model","kr.co.ziptoon.model.impl"} )
@Import({DBconfig.class})	
public class ApplicationConfig {

}
