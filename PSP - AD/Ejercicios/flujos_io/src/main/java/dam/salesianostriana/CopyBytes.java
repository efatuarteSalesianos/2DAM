package dam.salesianostriana;

import java.io.*;
import java.util.Arrays;
import java.util.List;

public class CopyBytes {

    public static void main(String[] args) {

        if (args.length != 2) {
            System.err.println("Error de sintaxis. Se necesitan dos argumentos");
            return;
        }

        BufferedInputStream bin = null;
        BufferedOutputStream bout = null;

        final int TAM = 1024 * 16;

        try {
            //bin = new BufferedInputStream(new FileInputStream("openwebinars.jpg"));
            //bout = new BufferedOutputStream(new FileOutputStream("image_copy.jpg"));
            bin = new BufferedInputStream(new FileInputStream(args[0]));
            bout = new BufferedOutputStream(new FileOutputStream(args[1]));

            int cantidadBytes = 0;
            byte[] buffer = new byte[TAM];

            while ((cantidadBytes = bin.read(buffer, 0, TAM)) != -1) {
                bout.write(buffer, 0, cantidadBytes);
            }

            System.out.println("El fichero se ha copiado correctamente");

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (bin != null)
                try {
                    bin.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (bout != null)
                try {
                    bout.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }

    }
}
