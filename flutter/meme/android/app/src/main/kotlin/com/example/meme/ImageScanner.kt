package com.example.meme

import android.content.Context
import android.os.Environment
import android.provider.MediaStore
import io.flutter.plugin.common.MethodChannel
import java.io.File

class ImageScanner(private val context: Context) {
    fun getAllImages(result: MethodChannel.Result) {
        val projection = arrayOf(MediaStore.Images.Media.DATA)
        val cursor = context.contentResolver.query(
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
            projection,
            null,
            null,
            null
        )

        val imagePaths = mutableListOf<String>()

        cursor?.use {
            val columnIndex = it.getColumnIndexOrThrow(MediaStore.Images.Media.DATA)
            while (it.moveToNext()) {
                val path = it.getString(columnIndex)
                imagePaths.add(path)
            }
        }

        result.success(imagePaths)
    }

    fun getAllImagesInternal(): MutableList<String> {
        val projection = arrayOf(MediaStore.Images.Media.DATA)
        val cursor = context.contentResolver.query(
                MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                projection,
                null,
                null,
                null
        )

        val imagePaths = mutableListOf<String>()

        cursor?.use {
            val columnIndex = it.getColumnIndexOrThrow(MediaStore.Images.Media.DATA)
            while (it.moveToNext()) {
                val path = it.getString(columnIndex)
                imagePaths.add(path)
            }
        }

        return imagePaths;
    }
}
