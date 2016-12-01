# hydra-jetty
## Notice: This project is no longer maintained. The Hydra/Blacklight communities have switched to [solr_wrapper](https://rubygems.org/gems/solr_wrapper) and [fcrepo_wrapper](https://rubygems.org/gems/fcrepo_wrapper) to address these needs.

This is a copy of jetty with the needed applications for running Hydra.  These include two java-based applications:

* [Fedora repository](https://github.com/futures/fcrepo4)
* [Solr](http://lucene.apache.org/solr/)

## Included Versions

* Jetty: 8.1.16
* Solr: 4.10.4
* Fedora: 4.4.0

## Usage

### Dependencies

* [Java 8 (JRE)](https://java.com/en/download/index.jsp)

### Manual

    git clone https://github.com/projecthydra/hydra-jetty
    cd hydra-jetty
    java -Xmx512m -jar start.jar

You can also change the port jetty starts on by editing the file etc/jetty.xml and changing this line to indicate a different port number:

    <Set name="port"><SystemProperty name="jetty.port" default="8983"/></Set>

### Using jettywrapper

For use within your Hydra application's Rails directory.

    rake jetty:install
    rake jetty:start

See [jettywrapper](https://github.com/projecthydra/jettywrapper) for more information regarding configuration and usage.
Port numbers and other java options maybe configured via the gem.

### Interaction

When jetty is finished initializing itself, Solr is available at

* [http://localhost:8983/solr/](http://localhost:8983/solr/)

and Fedora is available at

* [http://localhost:8983/fedora/](http://localhost:8983/fedora/)
* basic authorization is enabled an requires the username/password `fedoraAdmin/fedoraAdmin`
* this is configured under [jetty-users.properties](resources/jetty-users.properties)

You can see a list of all installed applications at

* [http://localhost:8983](http://localhost:8983)

### Updating

#### Solr and Jetty

Solr is updated by downloading the latest from [Lucene](http://lucene.apache.org/solr/), which includes an instance of Jetty in the
`example` directory.  Updating is a process of replacing the jar files as well as the solr.war and start.jar files.  Note that the
example from Lucene does not include the start.ini file.

## Fedora Migration

For tesing migration from Fedora version 3 to 4, the `fedora-4/migration` branch has both Fedora 3 and Fedora 4 installed, along with Solr, and is available
via this url:

    https://github.com/projecthydra/hydra-jetty/archive/fedora-4/migrate.zip
