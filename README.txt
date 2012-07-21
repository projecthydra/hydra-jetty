HYDRA-JETTY
--------------------------
This is a copy of jetty pre-installed with various applications needed by hydra applications.
Most notably, these include fedora (http://fedora-commons.org/) and solr (http://lucene.apache.org/solr/).  

To run, use 

  java -XX:+CMSPermGenSweepingEnabled -XX:+CMSClassUnloadingEnabled -XX:PermSize=64M -XX:MaxPermSize=128M -jar start.jar

When jetty is finished initializing itself, Solr is available at 

  	http://localhost:8983/solr/development/admin/
  	http://localhost:8983/solr/test/admin/

and fedora is available at 

	http://localhost:8983/fedora/
        http://localhost:8983/fedora-test/

You can see a list of all installed applications at http://localhost:8983

You can also change the port jetty starts on by editing the file etc/jetty.xml and changing this line to indicate a different port number:

<Set name="port"><SystemProperty name="jetty.port" default="8983"/></Set>


Included Versions
-----------------
jetty: 6.1.26
solr: 3.5.0
fedora: 3.5
