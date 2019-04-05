# Parent POM: stocky37
Parent POM for stocky37 OSS java projects

Sets up the following:

* Default developer section
* Default MIT licence
* Plugins for deploying to [OSSRH](https://oss.sonatype.org/)
  * [maven-release-plugin](http://maven.apache.org/maven-release/maven-release-plugin/)
  * [maven-gpg-plugin](http://maven.apache.org/plugins/maven-gpg-plugin/)
  * [maven-javadoc-plugin](http://maven.apache.org/plugins/maven-javadoc-plugin/)
  * [maven-source-plugin](http://maven.apache.org/plugins/maven-source-plugin/)
  * [nexus-staging-maven-plugin](https://github.com/sonatype/nexus-maven-plugins/tree/master/staging/maven-plugin)
* Other plugins
  * [sortpom-maven-plugin](https://github.com/Ekryd/sortpom)
  
To perform a release run the following:

```bash
mvn release:prepare release:perform
```

This will build and sign the jar (along with source & javadoc jars), deploy it to the OSSRH staging repository, and
then assuming all the checks pass, promote the release and close the staging repository.

## Release Profiles

Some optional release profiles have been included which can help define the `developmentVersion` during a release.
These profiles help you bump the major version, minor version and patch version (assuming semver). A minor version bump
is the default option. 

If you wish to use one of these profiles just add it to the `releaseProfiles` parameter of the release plugin.
```
mvn release:prepare release:perform -DreleaseProfiles=release,[major|minor|patch]
```

## Maven settings

### OSSRH Access

```xml
<server>
  <id>ossrh</id>
  <username>${ossrhUsername}</username>
  <password>${ossrhPassword}</password>
</server>
```

### GPG Passphrase

```xml
<server>
  <id>gpg.passphrase</id>
  <passphrase>${gpgPassphrase}</passphrase>
</server>
```

### Customise GPG Executable

Only do this if necessary

```xml
<profiles>
  <profile>
    <id>ossrh</id>
    <activation>
      <activeByDefault>true</activeByDefault>
    </activation>
    <properties>
      <!-- just one of these if necessary -->
      <gpg.executable>gpg2</gpg.executable>
      <gpg.executable>C:/Program Files/Git/usr/bin/gpg</gpg.executable>
    </properties>
  </profile>
</profiles>
```