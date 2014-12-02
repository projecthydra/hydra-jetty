Fedora3 for hydra-jetty
-------------------------------

This is a special instance of Fedora3 to be used in conjunction with Fedora4 to test migration.

Replace fedora3.war

The install of Fedora should use
	fedora.admin.pass: fedoraAdmin
	ssl.available: false
	servlet.engine: other
	database: included
	xacml.enabled (policy enforcement): false

Remove all the *.wars from $FEDORA_HOME/install

Update port references from 8080 to 8983 (fedora.fcfg, spring/web.properties)

Replace all absolute paths for FEDORA_HOME (in fedora.fcfg, akubra-llstore.xml, install.properties) with the relative path, "fedora/default"
