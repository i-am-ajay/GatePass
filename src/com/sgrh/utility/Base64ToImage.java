package com.sgrh.utility;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.Base64.Decoder;

import javax.imageio.ImageIO;

public class Base64ToImage {
	public static void getImageFromBase64(String urlString, String imageName, String realPath) {
		String image = urlString.substring(urlString.indexOf(",")+1);
		Decoder decoder = Base64.getDecoder();
		byte [] imageBytes = decoder.decode(image);
		try {
			BufferedImage bfImage = ImageIO.read(new ByteArrayInputStream(imageBytes));
			imageName = imageName;
			File file = Paths.get(realPath,"/resources/images",imageName).toFile();
			ImageIO.write(bfImage, "png", file);
			bfImage.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
