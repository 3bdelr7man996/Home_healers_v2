# Preserve SLF4J classes and interfaces
-keep class org.slf4j.** { *; }
-keep interface org.slf4j.** { *; }

# Don't warn about missing okhttp classes
-dontwarn com.squareup.okhttp.CipherSuite
-dontwarn com.squareup.okhttp.ConnectionSpec
-dontwarn com.squareup.okhttp.TlsVersion
# Missing rules from R8 output
-keep class com.yourpackage.** { *; }
-keep class androidx.** { *; }