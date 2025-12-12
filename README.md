# tap_talk

A new Flutter project.

## Environment Guide

📘 Setup Guide — Flutter Environment (Windows)

This document explains the required steps to install and configure the Flutter development environment on Windows, including Flutter SDK setup, Android Studio configuration, SDK tools, and validation using flutter doctor.

✅ Prerequisites

Windows 10 or later (64-bit)

Git installed

Visual Studio Code (optional but recommended)

PowerShell or CMD

🚀 1. Install Flutter

Follow the official Flutter installation guide:

👉 https://docs.flutter.dev/get-started/quick


(Section: Install and set up Flutter)

Main steps:

Download the Flutter SDK (stable channel).

Extract it to a directory, e.g.:

C:\Users\<user>\flutter\


Add the following to your PATH:

C:\Users\<user>\flutter\bin


Verify installation:

flutter --version

🛠 2. Install Android Studio

Flutter requires the Android SDK. Install Android Studio from:

👉 https://developer.android.com/studio

⚙️ 3. Configure Android SDK

Open Android Studio → More Actions → SDK Manager.

A. SDK Platforms

Install:

Android 16.0 (API Level 36) — recommended target platform

B. SDK Tools

Enable:

Android SDK Build-Tools

Android SDK Platform-Tools

Android SDK Command-line Tools (latest)

(Optional) Android Emulator

Apply changes and wait for downloads to complete.

📄 4. Accept Android Licenses

Run:

flutter doctor --android-licenses


Press y to accept all licenses.

🔍 5. Verify Setup

Check the environment:

flutter doctor


Expected output (simplified):

[✓] Flutter
[✓] Android toolchain (SDK 36.x.x)
[✓] Chrome
[✓] Connected devices


A Visual Studio warning can be ignored — it is only needed for Windows desktop apps, not Android.

📱 6. Environment Ready

You can now:

Run the app on an emulator or physical device

Build APK/AppBundle:

flutter build apk
flutter build appbundle

🎯 Summary

Your environment now includes:

Flutter SDK (stable)

Android SDK API 36

Build-tools + command-line tools installed

Accepted Android licenses

Android Studio configured

You are ready to develop and publish Android apps.
