import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileUploadService {
  static Future<File?> pickImageFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      debugPrint('Error picking image file: $e');
    }
    return null;
  }

  static Future<File?> pickCustomFile({
    required List<String> allowedExtensions,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      debugPrint('Error picking custom file: $e');
    }
    return null;
  }

  static Future<List<File>> pickMultipleFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
      );

      if (result != null) {
        return result.paths
            .where((path) => path != null)
            .map((path) => File(path!))
            .toList();
      }
    } catch (e) {
      debugPrint('Error picking multiple files: $e');
    }
    return [];
  }

  static Future<File?> pickAnyFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      debugPrint('Error picking any file: $e');
    }
    return null;
  }

  static Future<File?> pickVideoFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      debugPrint('Error picking video file: $e');
    }
    return null;
  }

  static Future<File?> pickAudioFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      debugPrint('Error picking audio file: $e');
    }
    return null;
  }

  static Future<File?> pickDocumentFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt', 'rtf'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      debugPrint('Error picking document file: $e');
    }
    return null;
  }

  static String getFileExtension(String filePath) {
    return filePath.split('.').last.toLowerCase();
  }

  static String getFileName(String filePath) {
    return filePath.split('/').last;
  }

  static bool isImageFile(String filePath) {
    final extension = getFileExtension(filePath);
    return ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension);
  }

  static bool isVideoFile(String filePath) {
    final extension = getFileExtension(filePath);
    return ['mp4', 'avi', 'mov', 'mkv', 'wmv', 'flv', 'webm'].contains(extension);
  }

  static bool isAudioFile(String filePath) {
    final extension = getFileExtension(filePath);
    return ['mp3', 'wav', 'aac', 'ogg', 'flac', 'm4a'].contains(extension);
  }

  static bool isDocumentFile(String filePath) {
    final extension = getFileExtension(filePath);
    return ['pdf', 'doc', 'docx', 'txt', 'rtf', 'xls', 'xlsx', 'ppt', 'pptx'].contains(extension);
  }
}