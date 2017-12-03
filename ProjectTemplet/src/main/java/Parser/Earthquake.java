package Parser;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;

public class Earthquake {
    public final static String eURL = "http://newsky2.kma.go.kr/service/ErthqkInfoService/EarthquakeReport";
    public final static String KEY = "iBv%2FgYoMdewvMS0j53%2BlOVimhNDifEaKSn15586oh4P%2ButwLaQb2RNhCqtIkekXC0aVqF3fDCGGuTAgkT9RN7w%3D%3D";
    public static String[] month = {
            "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    };

    public Earthquake() {
        try{
            apiParserSearch();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<String> apiParserSearch() throws Exception {
        URL url = new URL(getURLParam(null));

        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");

        String tag = null;
        int event_type = xpp.getEventType();

        String addr = null;
        ArrayList<String> list = new ArrayList<String>();
        while(event_type != XmlPullParser.END_DOCUMENT) {
            if(event_type == XmlPullParser.START_TAG) {
                tag = xpp.getName();
            } else if(event_type == XmlPullParser.TEXT) {
                if(tag.equals("Lat"))
                    addr = xpp.getText();
                else if(tag.equals("Lon"))
                    addr = xpp.getText();
            } else if(event_type == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                if(tag.equals("item")) {
                    list.add((addr));
                }
            }
            event_type = xpp.next();
        }
        list.add("36.7637768");
        list.add("127.2816014");
        return list;
    }

    private String getURLParam(String search) {
        Date date = new Date();
        String dateStr = date.toString();

        String[] splitStr = new String[6];
        splitStr = dateStr.split(" ");

        String need = "";
        need += splitStr[5];

        int monthNum = 0;
        for(int i = 0; i < month.length; i++) {
            if(month[i].equals(splitStr[1]))
                monthNum = i;
        }

        need += (monthNum + "" + splitStr[2]);
        String url = eURL + "?serviceKey=" + KEY + "&numOfRows=10&pageSize=10&pageNo=1&startPage=1&fromTmFc=20160101&toTmFc="+need;
        return url;
    }
}