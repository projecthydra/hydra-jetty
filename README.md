# hydra-jetty

This is a copy of jetty with the needed applications for running Hydra.  These include two java-based applications:

* [Fedora repository](https://github.com/futures/fcrepo4)
* [Solr](http://lucene.apache.org/solr/)

## Included Versions

* jetty: 8.1.10.v20130312
* solr: 4.9.0
* fedora: 3.7.1

## Usage

### Dependencies

* [Java 7 (JRE)](https://java.com/en/download/index.jsp)

#### Java 6

Java 6 is unsupported under Solr 4.9, but still supported under Fedora 3.7.1.  However, hydra-jetty has only been tested under
Java 7 so it is recommended to use Java 7 and not Java 6.

### Manual
  
    git clone https://github.com/projecthydra/hydra-jetty
    cd hydra-jetty
    java -Xmx256m -XX:MaxPermSize=256m -jar start.jar

You can also change the port jetty starts on by editing the file etc/jetty.xml and changing this line to indicate a different port number:

    <Set name="port"><SystemProperty name="jetty.port" default="8983"/></Set>

### Using jettywrapper

For use within your Hydra application's Rails directory.

    rake jetty:install
    rake jetty:start

See [jettywrapper](https://github.com/projecthydra/jettywrapper) for more information regarding configuration and usage.
Port numbers and other java options maybe configured via the gem. 

### Fedora Resource Index

This installation of Fedora has the Resource Index enabled.  If you wish to disable the Resource Index for your development or test copies of Fedora, you can do so by modifying, respectfully, fedora/default/server/config/fedora.fcfg or fedora/test/server/config/fedora.fcfg.

Change this: 

    <module role="org.fcrepo.server.resourceIndex.ResourceIndex" class="org.fcrepo.server.resourceIndex.ResourceIndexModule">
      <comment>Supports the ResourceIndex.</comment>
      <param name="level" value="1">

To this:

    <module role="org.fcrepo.server.resourceIndex.ResourceIndex" class="org.fcrepo.server.resourceIndex.ResourceIndexModule">
      <comment>Supports the ResourceIndex.</comment>
      <param name="level" value="0">

### Interaction

When jetty is finished initializing itself, Solr is available at 

* [http://localhost:8983/solr/](http://localhost:8983/solr/)

Fedora is available in two copies, one for developement

* [http://localhost:8983/fedora/](http://localhost:8983/fedora/)

and an additional copy for testing:

* [http://localhost:8983/fedora-test/](http://localhost:8983/fedora-test/)

You can see a list of all installed applications at

* [http://localhost:8983](http://localhost:8983)

### Updating

#### Solr and Jetty

Solr is updated by downloading the latest from [Lucene](http://lucene.apache.org/solr/), which includes an instance of Jetty in the
`example` directory.  Updating is a process of replacing the jar files as well as the solr.war and start.jar files.  Note that the
example from Lucene does not include the start.ini file.

## Fedora Migration

Fedora4 is currently available in the `fedora-4/master` branch and can be automatically downloaded and installed via Jettywrapper
using this url:

    https://github.com/projecthydra/hydra-jetty/archive/fedora-4/master.zip

If you want to give migration a try, the `fedora-4/migration` branch has both Fedora3 and Fedora4 installed, along with Solr, and is available
via this url:

    https://github.com/projecthydra/hydra-jetty/archive/fedora-4/migrate.zip
