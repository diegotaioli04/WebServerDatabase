package com.mycompany.servletlink;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import java.io.File;
import java.io.IOException;

public class SerializzareDeserializzare {
    static final File WEB_ROOT = new File(".");
    String filej = null;
    String filex = null;
    ObjectMapper Omapper = null;
    XmlMapper xmapper = null;
    lista p = null;
    
    public SerializzareDeserializzare(String j, String x){
        this.filej = j;
        this.filex = x;
        Omapper = new ObjectMapper(); 
        xmapper = new XmlMapper();
    }
    
    public void FromJSONToString() {
        try{        
            Omapper = new ObjectMapper();   
            p = Omapper.readValue(new File(WEB_ROOT, filej), lista.class);
        } catch (Exception e) {	
            e.printStackTrace();
	}
    }
    
    public File FromStringToXML(){
        FromJSONToString();
        File xmlf = null;
        try{        
            xmapper.writeValue(new File(WEB_ROOT, filex), p);    
            xmlf = new File(filex);
        } catch (Exception e) {	
            e.printStackTrace();
	}
        return xmlf;
    }
}
	
