/**
 * EfikaUsers_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package vraptor_suporten2.dal.webservice;

@SuppressWarnings("serial")
public class EfikaUsers_ServiceLocator extends org.apache.axis.client.Service implements vraptor_suporten2.dal.webservice.EfikaUsers_Service {

    public EfikaUsers_ServiceLocator() {
    }


    public EfikaUsers_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public EfikaUsers_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for _8
    private java.lang.String _8_address = "http://10.200.35.67:80/EfikaWs/EfikaUsers";

    public java.lang.String get_8Address() {
        return _8_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String _8WSDDServiceName = "80";

    public java.lang.String get_8WSDDServiceName() {
        return _8WSDDServiceName;
    }

    public void set_8WSDDServiceName(java.lang.String name) {
        _8WSDDServiceName = name;
    }

    public vraptor_suporten2.dal.webservice.EfikaUsers_PortType get_8() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(_8_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return get_8(endpoint);
    }

    public vraptor_suporten2.dal.webservice.EfikaUsers_PortType get_8(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            vraptor_suporten2.dal.webservice.EfikaUsersSoapBindingStub _stub = new vraptor_suporten2.dal.webservice.EfikaUsersSoapBindingStub(portAddress, this);
            _stub.setPortName(get_8WSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void set_8EndpointAddress(java.lang.String address) {
        _8_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(@SuppressWarnings("rawtypes") Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (vraptor_suporten2.dal.webservice.EfikaUsers_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                vraptor_suporten2.dal.webservice.EfikaUsersSoapBindingStub _stub = new vraptor_suporten2.dal.webservice.EfikaUsersSoapBindingStub(new java.net.URL(_8_address), this);
                _stub.setPortName(get_8WSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    @SuppressWarnings("rawtypes")
	public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("80".equals(inputPortName)) {
            return get_8();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://webservices/", "EfikaUsers");
    }

    @SuppressWarnings("rawtypes")
	private java.util.HashSet ports = null;

    @SuppressWarnings({ "rawtypes", "unchecked" })
	public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://webservices/", "80"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("_8".equals(portName)) {
            set_8EndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
