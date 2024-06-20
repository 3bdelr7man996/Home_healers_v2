# Preserve SLF4J classes and interfaces
-dontwarn org.slf4j.impl.StaticLoggerBinder
-dontwarn org.slf4j.impl.StaticMDCBinder
-dontwarn org.slf4j.impl.StaticMarkerBinder
# Don't warn about missing okhttp classes
-dontwarn com.squareup.okhttp.CipherSuite
-dontwarn com.squareup.okhttp.ConnectionSpec
-dontwarn com.squareup.okhttp.TlsVersion
# Missing rules from R8 output
-keep class com.yourpackage.** { *; }
-keep class androidx.** { *; }