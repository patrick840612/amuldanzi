package com.amuldanzi.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.http.HttpHost;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.springframework.stereotype.Component;

@Component
public class MariaDBToElasticStart {

    // ElasticSearch 클러스터 호스트 및 포트 설정 (주소는 적절하게 변경)
    private static final String ES_HOST = "localhost";
    private static final int ES_PORT = 9200;

    // MariaDB 접속 정보
    private static final String DB_URL = "jdbc:mariadb://localhost:3306/final"; // 데이터베이스 이름으로 변경
    private static final String DB_USER = "amul";
    private static final String DB_PASSWORD = "danzi";

    public static void main(String[] args) {
        // 스케줄링 작업을 위한 ScheduledExecutorService 생성
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        // 주기적으로 실행할 작업 (데이터를 Elasticsearch로 색인하는 작업)
        Runnable task = new Runnable() {
            public void run() {
                MariaDBToElasticStart indexer = new MariaDBToElasticStart();
                indexer.indexDataFromMariaDBNotice();
                indexer.indexDataFromMariaDBCare();
                indexer.indexDataFromMariaDBEducation();
                indexer.indexDataFromMariaDBOrder();
            }
        };

        // 5분마다 작업 실행
        scheduler.scheduleAtFixedRate(task, 0, 1, TimeUnit.MINUTES);
    }

    // MariaDB의 특정 테이블 데이터를 Elasticsearch에 색인하는 메서드
    protected void indexDataFromMariaDBNotice() {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                Statement statement = connection.createStatement();
                RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

            String sql = "SELECT n.id id, n.category category, n.title title, n.count count, n.regdate regdate, bc.cate_id cate_id FROM notice n JOIN board_cate bc ON n.cate_id = bc.cate_id";
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int cateId = resultSet.getInt("cate_id");
                String title = resultSet.getString("title");
                int id = resultSet.getInt("id");
                int count = resultSet.getInt("count");
                Date regdate = resultSet.getDate("regdate");

                // JSON 형식으로 데이터 변환
                String jsonBody = "{" +
                        "\"cate_id\":\"" + cateId + "\"," +
                        "\"id\":\"" + id + "\"," +
                        "\"title\":\"" + title + "\"," +
                        "\"count\":\"" + count + "\"," +
                        "\"regdate\":\"" + regdate + "\"" +
                        "}";

                // ElasticSearch에 데이터 색인
                IndexRequest request = new IndexRequest("notice2").id(Integer.toString(id)).source(jsonBody, XContentType.JSON);
                IndexResponse response = client.index(request, RequestOptions.DEFAULT);
                System.out.println("Indexed document with ID: " + response.getId());
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }
	
    //이하 색인작업 반복
	protected void indexDataFromMariaDBCare() {
		// TODO Auto-generated method stub
	    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            Statement statement = connection.createStatement();
	            RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

	           String sql = "SELECT c.id id, c.animal animal, c.title title, c.count count, bc.cate_id cate_id, c.regdate regdate FROM care c JOIN board_cate bc ON c.cate_id = bc.cate_id";
	           ResultSet resultSet = statement.executeQuery(sql);   


	           while (resultSet.next()) {
	        	   int cateId = resultSet.getInt("cate_id");
	               int id = resultSet.getInt("id");
	               String title = resultSet.getString("title");
	               String animal = resultSet.getString("animal");
	               int count = resultSet.getInt("count");
	               Date regdate = resultSet.getDate("regdate");

	               // JSON 형식으로 데이터 변환
	               String jsonBody = "{" +
	            		   "\"cate_id\":\"" + cateId + "\"," +
	                       "\"id\":\"" + id + "\"," +
	                       "\"title\":\"" + title + "\"," +
	                       "\"animal\":\"" + animal + "\"," +
	                       "\"count\":\"" + count + "\"," +
	                       "\"regdate\":\"" + regdate + "\"" +
	                       "}";

	               // ElasticSearch에 데이터 색인
	               IndexRequest request = new IndexRequest("care2").id(Integer.toString(id)).source(jsonBody, XContentType.JSON);
	               IndexResponse response = client.index(request, RequestOptions.DEFAULT);
	               System.out.println("Indexed document with ID: " + response.getId());
	           }

	       } catch (SQLException | IOException e) {
	           e.printStackTrace();
	       }
		
	}
	
	protected void indexDataFromMariaDBEducation() {
		// TODO Auto-generated method stub
	    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            Statement statement = connection.createStatement();
	            RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

	        String sql = "SELECT e.id id, e.animal animal, e.count count, e.title title, bc.cate_id cate_id, e.regdate regdate FROM education e JOIN board_cate bc ON e.cate_id = bc.cate_id";
	        ResultSet resultSet = statement.executeQuery(sql);

	        while (resultSet.next()) {
	        	int cateId = resultSet.getInt("cate_id");
	            int id = resultSet.getInt("id");
	            String title = resultSet.getString("title");
	            String animal = resultSet.getString("animal");
	            int count = resultSet.getInt("count");
	            Date regdate = resultSet.getDate("regdate");

	            // JSON 형식으로 데이터 변환
	            String jsonBody = "{" +
	            		"\"cate_id\":\"" + cateId + "\"," +
	                    "\"id\":\"" + id + "\"," +
	                    "\"title\":\"" + title + "\"," +
	                    "\"animal\":\"" + animal + "\"," +
	                    "\"count\":\"" + count + "\"," +
	                    "\"regdate\":\"" + regdate + "\"" +
	                    "}";

	            // ElasticSearch에 데이터 색인
	            IndexRequest request = new IndexRequest("education2").id(Integer.toString(id)).source(jsonBody, XContentType.JSON);
	            IndexResponse response = client.index(request, RequestOptions.DEFAULT);
	            System.out.println("Indexed document with ID: " + response.getId());
	        }

	    } catch (SQLException | IOException e) {
	        e.printStackTrace();
	    }
	}
	

    protected void indexDataFromMariaDBOrder() {
        // TODO Auto-generated method stub
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                Statement statement = connection.createStatement();
                RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

            String sql = "SELECT c.commerce_id AS commerceId, c.commerce_name AS commerceName, c.commerce_price AS commercePrice, c.commerce_stock AS commerceStock, c.commerce_per AS commercePer, oi.item_id AS itemId, oi.count AS itemCount, oi.price AS itemPrice, oi.tracking_number AS trackingNumber, o.order_id AS orderId, o.total_price AS totalPrice, o.pay_date AS payDate, o.order_status AS orderStatus, o.one_id AS oneId, o.shop_id AS shopId, o.card_num AS cardNum, o.id AS memberId FROM commerce c JOIN order_items oi ON c.commerce_id = oi.commerce_id JOIN orders o ON oi.order_id = o.order_id";
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int commerceId = resultSet.getInt("commerceId");
                String commerceName = resultSet.getString("commerceName");
                int commercePrice = resultSet.getInt("commercePrice");
                int commerceStock = resultSet.getInt("commerceStock");
                int commercePer = resultSet.getInt("commercePer");
                int itemId = resultSet.getInt("itemId");
                int itemCount = resultSet.getInt("itemCount");
                int itemPrice = resultSet.getInt("itemPrice");            
                int orderId = resultSet.getInt("orderId");
                int totalPrice = resultSet.getInt("totalPrice");
                Date payDate = resultSet.getDate("payDate");
                String orderStatus = resultSet.getString("orderStatus");
                String oneId = resultSet.getString("oneId");
                String shopId = resultSet.getString("shopId");
                String cardNum = resultSet.getString("cardNum");
                String memberId = resultSet.getString("memberId");

                // JSON 형식으로 데이터 변환
                String jsonBody = "{" +
                        "\"commerceId\":\"" + commerceId + "\"," +
                        "\"commerceName\":\"" + commerceName + "\"," +
                        "\"commercePrice\":\"" + commercePrice + "\"," +
                        "\"commerceStock\":\"" + commerceStock + "\"," +
                        "\"commercePer\":\"" + commercePer + "\"," +
                        "\"itemId\":\"" + itemId + "\"," +
                        "\"itemCount\":\"" + itemCount + "\"," +
                        "\"itemPrice\":\"" + itemPrice + "\"," +                        
                        "\"orderId\":\"" + orderId + "\"," +
                        "\"totalPrice\":\"" + totalPrice + "\"," +
                        "\"payDate\":\"" + payDate + "\"," +
                        "\"orderStatus\":\"" + orderStatus + "\"," +
                        "\"oneId\":\"" + oneId + "\"," +
                        "\"shopId\":\"" + shopId + "\"," +
                        "\"cardNum\":\"" + cardNum + "\"," +
                        "\"memberId\":\"" + memberId + "\"" +
                        "}";

                // ElasticSearch에 데이터 색인
                IndexRequest request = new IndexRequest("order").id(Integer.toString(commerceId)).source(jsonBody, XContentType.JSON);
                IndexResponse response = client.index(request, RequestOptions.DEFAULT);
                System.out.println("Indexed document with ID: " + response.getId());
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }
	
	
}