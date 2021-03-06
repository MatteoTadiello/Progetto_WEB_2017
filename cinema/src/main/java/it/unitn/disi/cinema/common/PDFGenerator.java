/*
 * Cinema Universe - Reservation System
 * Copyright (C) 2018 Domenico Stefani, Ivan Martini, Matteo Tadiello
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * See <http://www.gnu.org/licenses/>.
 */
package it.unitn.disi.cinema.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import static org.apache.pdfbox.pdmodel.font.PDType1Font.HELVETICA;
import static org.apache.pdfbox.pdmodel.font.PDType1Font.HELVETICA_BOLD;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

/**
 *
 * @author matteo
 */
public class PDFGenerator {

    public static void generaPDF(String utente, ArrayList<File> qrCode, File path) throws IOException {

        //CREAZIONE DEL PDF
        try (PDDocument doc = new PDDocument()) {
            ArrayList<PDPage> page = new ArrayList<>(); //Array list delle pagine contenute nel pdf
            page.add(new PDPage());
            int counter = 0;
            doc.addPage(page.get(counter));

            ArrayList<PDPageContentStream> contentStream = new ArrayList<>();
            contentStream.add(new PDPageContentStream(doc, page.get(counter)));

            contentStream.get(counter).beginText();

            //Titolo
            contentStream.get(counter).newLineAtOffset(30, 700);
            PDFont font = HELVETICA_BOLD;
            contentStream.get(counter).setFont(font, 24);
            contentStream.get(counter).showText("Biglietti Cinema World");
            contentStream.get(counter).endText();

            //Sottotitolo
            contentStream.get(counter).beginText();
            contentStream.get(counter).newLineAtOffset(30, 650);
            font = HELVETICA;
            contentStream.get(counter).setFont(font, 16);
            contentStream.get(counter).showText("Sotto puo' trovare tutti i codici QR corrispondenti ai biglietti da lei comprati: ");
            contentStream.get(counter).endText();
            contentStream.get(counter).close();

            //Inserimento dei qr code all'interno del pdf
            for (File qr : qrCode) {
                counter++;
                page.add(new PDPage());
                doc.addPage(page.get(counter));
                contentStream.add(new PDPageContentStream(doc, page.get(counter)));
                contentStream.get(counter).beginText();

                contentStream.get(counter).newLineAtOffset(30, 700);
                font = HELVETICA;
                contentStream.get(counter).setFont(font, 20);
                contentStream.get(counter).showText("Biglietto numero " + counter);
                contentStream.get(counter).endText();
                PDImageXObject pdImage = PDImageXObject.createFromFile(qr.toString(), doc);
                contentStream.get(counter).drawImage(pdImage, 150, 200);
                contentStream.get(counter).close();
            }

            doc.save(path);
            doc.close();
        }

    }
}
