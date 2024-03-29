package com.wallpaperApp.wallpaper;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import android.app.WallpaperManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import java.io.IOException;
import java.io.InputStream;

enum Screen {
  Home,
  Lock,
  Both
}

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "setWallpaperProcess";
  public static Bitmap bitmap;
  

  
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
                    (call, result) -> {
                      if (call.method.equals("setHomeWallpaper")) 
                      {
                        final String url=call.argument("url");
                        result.success(setWallpaper(url,Screen.Home));
                      }
                      else if(call.method.equals("setLockWallpaper")) 
                      {
                        final String url=call.argument("url");
                        result.success(setWallpaper(url,Screen.Lock));
                      }
                      else 
                      {
                        final String url=call.argument("url");
                        result.success(setWallpaper(url,Screen.Both));
                      }
                    }
            );
  }
  public boolean setWallpaper(String imageURL,Screen type ) {
    boolean isSucces = false;
    GetImageFromUrl a = new GetImageFromUrl();
    a.execute(imageURL);
    WallpaperManager manager = WallpaperManager.getInstance(getApplicationContext());
    do {
      if(bitmap != null){
        try {
          switch (type) {
            case Home:
             { manager.setBitmap(bitmap,null, false, WallpaperManager.FLAG_SYSTEM);
              break;}
            case Lock:
             { manager.setBitmap(bitmap,null, false, WallpaperManager.FLAG_LOCK);
              break;
             }
            default:
             { manager.setBitmap(bitmap,null, false, WallpaperManager.FLAG_LOCK | WallpaperManager.FLAG_SYSTEM );
              break;
             }
          }
          a.cancel(true);
          isSucces = true;
          bitmap=null;
        } catch (IOException e) {
          isSucces = false;
        }
      }
    }
    while (!a.isCancelled());
   
    return isSucces;
  }
}

class GetImageFromUrl extends AsyncTask<String, Void, Bitmap> {

  @Override
  protected Bitmap doInBackground(String... url) {
    String stringUrl = url[0];
    MainActivity.bitmap=null;
    InputStream inputStream;
    try {
      inputStream = new java.net.URL(stringUrl).openStream();
      MainActivity.bitmap = BitmapFactory.decodeStream(inputStream);
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