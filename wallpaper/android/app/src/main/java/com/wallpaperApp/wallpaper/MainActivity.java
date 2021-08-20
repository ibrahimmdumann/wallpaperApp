package com.wallpaperApp.wallpaper;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;


import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodChannel;

import android.app.DownloadManager;
import android.app.WallpaperManager;
import android.content.Context;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;



import android.media.MediaPlayer;
import android.os.Environment;

import android.widget.Toast;

import java.io.File;

import java.io.IOException;
import java.io.InputStream;



public class MainActivity extends FlutterActivity {
    MediaPlayer mediaplayer;
  private static final String CHANNEL = "heartbeat.fritz.ai/native";
  public static Bitmap bitmap;
    private Context context;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler((call, result) -> {
              if (call.method.equals("sethomeWallpaper")) {
                
               sethomewall();
    
              }
    
            });
      }
  public void sethomewall() {
    String imageURL= "https://enestekle.com/ataturk_wallpaper/upload/189698_1542483413.jpeg";
    bitmap=null;
  new GetImageFromUrl().execute(imageURL);
  WallpaperManager manager = WallpaperManager.getInstance(getApplicationContext());
  do {
      if(bitmap != null){

      }
  }
  while (bitmap == null);
  if(bitmap != null){
      try {
          System.out.println("idris2," + bitmap);
          manager.setBitmap(bitmap);
          Toast.makeText(this, "Wallpaper set!", Toast.LENGTH_SHORT).show();
      } catch (IOException e) {
          Toast.makeText(this, "Error!", Toast.LENGTH_SHORT).show();
      }
  }

}
}
class GetImageFromUrl extends AsyncTask<String, Void, Bitmap> {


  @Override
  protected Bitmap doInBackground(String... url) {
      String stringUrl = url[0];
       MainActivity.bitmap=null;
      System.out.println("idris,"+stringUrl);
      InputStream inputStream;
      try {
          inputStream = new java.net.URL(stringUrl).openStream();
          MainActivity.bitmap = BitmapFactory.decodeStream(inputStream);
          System.out.println("idris,"+MainActivity.bitmap);
      } catch (IOException e) {
          e.printStackTrace();
      }
      return MainActivity.bitmap;
  }
  @Override
  protected void onPostExecute(Bitmap bitmap){

      super.onPostExecute(bitmap);

  }
}

