package player;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

/**
 * Operate helper about XML document.
 * @author wangtd
 */
public class XmlAccess {
	private File file = null;
	private SAXReader saxrd = null;
	private Document docm = null;
	private Element root = null;
	
	public XmlAccess(String file) throws DocumentException {
		this.file = new File(file);
		this.saxrd = new SAXReader();
		this.docm = this.saxrd.read(this.file);
		this.root = this.docm.getRootElement();
	}
	
	public XmlAccess(URL url) throws DocumentException {
		this.file = new File(url.getFile());
		this.saxrd = new SAXReader();
		this.docm = this.saxrd.read(url);
		this.root = this.docm.getRootElement();
	}
	
	/**
	 * Get the child nodes of a node.
	 * @param node
	 * @return
	 */
	public Element[] getNodes(Element node) {
		Iterator<?> it = null;
		Element[] ret = null;
		
		if (node == null) {
			it = this.root.elementIterator();
		} else {
			it = node.elementIterator();
		}
		
		while (it.hasNext()) {
			Element e = (Element)it.next();
			if (ret == null) {
				ret = new Element[]{e};
			} else {
				ret = Arrays.copyOf(ret, ret.length + 1);
				ret[ret.length - 1] = e;
			}
		}
		
		return ret;
	}
	
	/**
	 * Get the child nodes by the path.
	 * @param path
	 * @return
	 */
	public Element[] getNodes(String path) {
		Element[] ret = null;
		if (StringUtility.isNull(path)) {
			return ret;
		}
		
		String[] names = path.split("/");
		if (names.length == 0 && path.indexOf("/") > -1) {
			ret = new Element[]{this.root};
		} else {
			Element e = this.root;
			names = Arrays.copyOfRange(names, 1, names.length);
			for (String name : names) {
				Element[] nodes = this.getNodes(e);
				int index = 0;
				for (; index < nodes.length; index++) {
					if (name.equals(nodes[index].getName())) {
						if (name.equals(names[names.length - 1])) {
							if (ret == null) {
								ret = new Element[]{nodes[index]};
							} else {
								ret = Arrays.copyOf(ret, ret.length + 1);
								ret[ret.length - 1] = nodes[index];
							}
						} else {
							e = nodes[index];
							break;
						}
					}
				}
				if (index >= nodes.length) {
					break;
				}
			}
		}
		
		return ret;
	}
	
	/**
	 * Add a node to the location of path.
	 * @param path
	 * @param name
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public boolean addNode(String path, String name, String value) throws Exception {
		if (StringUtility.isNull(path) || StringUtility.isNull(name)) {
			return false;
		}
		
		Element[] e = this.getNodes(path);
		if (e == null) {
			return false;
		} else {
			e[0].addElement(name).addText(value);
			this.saveDocument();
		}
		
		return true;
	}
	
	/**
	 * Add a node to the location of path.
	 * @param path
	 * @param name
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public boolean addNode(String path, String name, Map<String, String> value) throws Exception {
		if (StringUtility.isNull(path) || value == null) {
			return false;
		}
		
		Element[] e = this.getNodes(path);
		if (e == null) {
			return false;
		} else {
			Element node = e[0].addElement(name);
			Iterator<String> it = value.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				node.addElement(key).addText(value.get(key));
			}
			this.saveDocument();
		}		
		
		return true;
	}
	
	/**
	 * Modify a exist node by the path.
	 * @param path
	 * @param index
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public boolean modifyNode(String path, int index, String value) throws Exception {
		if (StringUtility.isNull(path)) {
			return false;
		}
		
		Element[] e = this.getNodes(path);
		if (e == null) {
			return false;
		} else if (index < 0 || index >= e.length) {
			return false;
		} else {
			e[index].setText(value);		
			this.saveDocument();
		}	
		return true;
	}
	
	/**
	 * Modify a exist node by the path.
	 * @param path
	 * @param index
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public boolean modifyNode(String path, int index, Map<String, String> value) throws Exception {
		if (StringUtility.isNull(path)) {
			return false;
		}
		
		Element[] e = this.getNodes(path);
		if (e == null) {
			return false;
		} else if (index < 0 || index >= e.length) {
			return false;
		} else {
			Iterator<String> node = value.keySet().iterator();
			while (node.hasNext()) {
				String key = node.next();
				Iterator<?> it = e[index].elementIterator();
				while (it.hasNext()) {
					Element child = (Element)it.next();
					if (key.equals(child.getName())) {
						child.setText(value.get(key));
						break;
					}
				}
			}
			this.saveDocument();
		}	
		return true;
	}
	
	/**
	 * Remove the node whose location is specified by path and index.
	 * @param path
	 * @param index
	 * @return
	 * @throws Exception
	 */
	public boolean removeNode(String path, int index) throws Exception {
		if (StringUtility.isNull(path)) {
			return false;
		}
		
		Element[] e = this.getNodes(path);
		if (e == null) {
			return false;
		} else if (index < 0 || index >= e.length) {
			return false;
		} else {
			e[index].getParent().remove(e[index]);
			this.saveDocument();
		}		
		
		return true;
	}
	
	/**
	 * Save the XML document.
	 * @throws Exception
	 */
	public void saveDocument() throws Exception {
		OutputFormat format = new OutputFormat("\t",true,"UTF-8");
		format.setTrimText(true);
	    XMLWriter writer = null;
	    
		try {
			writer = new XMLWriter(new FileOutputStream(this.file), format);
			writer.write(this.docm);
		} catch (UnsupportedEncodingException e) {
			throw e;
		} catch (FileNotFoundException e) {
			throw e;
		} catch (IOException e) {
			throw e;
		} finally {
			writer.close();
		}
	}
}