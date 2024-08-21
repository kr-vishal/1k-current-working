package com.example.meme

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Environment
import org.tensorflow.lite.Interpreter
import java.io.FileInputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.channels.FileChannel

class ImageClassifier(context: Context, private val modelFilename: String) {

    private val interpreter: Interpreter = Interpreter(loadModelFile(context, modelFilename))

    fun classifyImage(imagePath: String): FloatArray {
        val imageBitmap = loadImageFromExternalStorage(imagePath)
        val inputArray = preprocessImage(imageBitmap)
        val outputArray = Array(1) { FloatArray(NUM_CLASSES) }
        interpreter.run(inputArray, outputArray)
        return outputArray[0]
    }

    private fun loadModelFile(context: Context, modelFilename: String): ByteBuffer {
        val fileDescriptor = context.assets.openFd(modelFilename)
        val inputStream = FileInputStream(fileDescriptor.fileDescriptor)
        val fileChannel = inputStream.channel
        val startOffset = fileDescriptor.startOffset
        val declaredLength = fileDescriptor.declaredLength
        return fileChannel.map(FileChannel.MapMode.READ_ONLY, startOffset, declaredLength)
    }

    private fun loadImageFromExternalStorage(imagePath: String): Bitmap {
        val file = FileInputStream("${Environment.getExternalStorageDirectory()}/$imagePath")
        return BitmapFactory.decodeStream(file)
    }

    private fun preprocessImage(imageBitmap: Bitmap): ByteBuffer {
        val modelInputSize = 224
        val inputArray = ByteBuffer.allocateDirect(1 * modelInputSize * modelInputSize * 3 * 4)
        inputArray.order(ByteOrder.nativeOrder())

        val resizedBitmap = Bitmap.createScaledBitmap(imageBitmap, modelInputSize, modelInputSize, true)
        resizedBitmap.getPixels(
            IntArray(modelInputSize * modelInputSize) { 0 },
            0,
            modelInputSize,
            0,
            0,
            modelInputSize,
            modelInputSize
        )

        for (i in 0 until modelInputSize) {
            for (j in 0 until modelInputSize) {
                val pixelValue = resizedBitmap.getPixel(j, i)
                inputArray.putFloat(((pixelValue shr 16 and 0xFF) - 127.5f) / 127.5f)
                inputArray.putFloat(((pixelValue shr 8 and 0xFF) - 127.5f) / 127.5f)
                inputArray.putFloat(((pixelValue and 0xFF) - 127.5f) / 127.5f)
            }
        }

        return inputArray
    }

    companion object {
        private const val NUM_CLASSES = 1000 // Example value, replace with actual number of classes in your model
    }
}
