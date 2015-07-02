package org.zch.test;

import java.io.File;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class Test {
	
	public static void main(String[] args) {
		SAXReader reader = new SAXReader();
		try {
			Document doc = reader.read(new File("src/export.xml"));
			Element root = doc.getRootElement();
			List<Element> list = root.elements("project");
			for(int i=0; i<list.size(); i++) {
				Element ele = list.get(i);
				String name = ele.attributeValue("name");
				if(name.equals("student")) {
					List<Element> l = ele.elements();
					for(int j=0; j<l.size(); j++) {
						System.out.println(l.get(j).getText());
					}
				}
			}
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
