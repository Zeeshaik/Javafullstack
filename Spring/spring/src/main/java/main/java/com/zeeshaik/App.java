package main.java.com.zeeshaik;

/**
 * Hello world!
 *
 */

import org.springframework.beans.factory.BeanFactory;
import org.springframework.core.io.FileSystemResource;

public class App {
    public static void main(String[] args) {
        BeanFactory factory = new XmlBeanFactory(new FileSystemResource("spring.xml"));
        Alien obj = (Alien) factory.getBean("alien");
    }
}
