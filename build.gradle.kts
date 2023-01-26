import software.amazon.smithy.gradle.tasks.SmithyBuild

plugins {
    id("software.amazon.smithy").version("0.6.0")
}

configure<software.amazon.smithy.gradle.SmithyExtension> {}

repositories {
    mavenLocal()
    mavenCentral()
}

buildscript {
    val smithyVersion = "1.25.1"
    dependencies {
        classpath("software.amazon.smithy:smithy-openapi:$smithyVersion")
        classpath("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
        classpath("software.amazon.smithy:smithy-cli:$smithyVersion")
    }
}

dependencies {
    val smithyVersion = "1.25.1"
    implementation("software.amazon.smithy:smithy-model:$smithyVersion")
    implementation("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
    implementation("software.amazon.smithy:smithy-validation-model:$smithyVersion")
    implementation("software.amazon.smithy:smithy-linters:$smithyVersion")
    implementation("software.amazon.smithy:smithy-openapi:$smithyVersion")
    implementation("software.amazon.smithy:smithy-waiters:$smithyVersion")
    implementation("software.amazon.smithy.typescript:smithy-typescript-codegen:0.11.0")
    implementation("software.amazon.smithy.typescript:smithy-aws-typescript-codegen:0.11.0")
    implementation("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
}