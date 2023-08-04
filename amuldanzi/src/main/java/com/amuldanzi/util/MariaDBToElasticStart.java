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
            }
        };

        // 5분마다 작업 실행
        scheduler.scheduleAtFixedRate(task, 0, 1, TimeUnit.MINUTES);
    }

	protected void indexDataFromMariaDBNotice() {
		// TODO Auto-generated method stub
	    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            Statement statement = connection.createStatement();
	            RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

	           String sql = "SELECT id, category, count, regdate FROM notice";
	           ResultSet resultSet = statement.executeQuery(sql);

	           while (resultSet.next()) {
	               int id = resultSet.getInt("id");	
	               int count = resultSet.getInt("count");
	               Date regdate = resultSet.getDate("regdate");

	               // JSON 형식으로 데이터 변환
	               String jsonBody = "{" +
	                       "\"id\":\"" + id + "\"," +
	                       "\"count\":\"" + count + "\"," +
	                       "\"regdate\":\"" + regdate + "\"" +
	                       "}";

	               // ElasticSearch에 데이터 색인
	               IndexRequest request = new IndexRequest("notice").id(Integer.toString(id)).source(jsonBody, XContentType.JSON);
	               IndexResponse response = client.index(request, RequestOptions.DEFAULT);
	               System.out.println("Indexed document with ID: " + response.getId());
	           }

	       } catch (SQLException | IOException e) {
	           e.printStackTrace();
	       }
		
	}
	
	protected void indexDataFromMariaDBCare() {
		// TODO Auto-generated method stub
	    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            Statement statement = connection.createStatement();
	            RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

	           String sql = "SELECT id, animal, count, regdate FROM care";
	           ResultSet resultSet = statement.executeQuery(sql);

	           while (resultSet.next()) {
	               int id = resultSet.getInt("id");
	               String animal = resultSet.getString("animal");
	               int count = resultSet.getInt("count");
	               Date regdate = resultSet.getDate("regdate");

	               // JSON 형식으로 데이터 변환
	               String jsonBody = "{" +
	                       "\"id\":\"" + id + "\"," +
	                       "\"animal\":\"" + animal + "\"," +
	                       "\"count\":\"" + count + "\"," +
	                       "\"regdate\":\"" + regdate + "\"" +
	                       "}";

	               // ElasticSearch에 데이터 색인
	               IndexRequest request = new IndexRequest("care").id(Integer.toString(id)).source(jsonBody, XContentType.JSON);
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

	        String sql = "SELECT id, animal, count, regdate FROM education";
	        ResultSet resultSet = statement.executeQuery(sql);

	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String animal = resultSet.getString("animal");
	            int count = resultSet.getInt("count");
	            Date regdate = resultSet.getDate("regdate");

	            // JSON 형식으로 데이터 변환
	            String jsonBody = "{" +
	                    "\"id\":\"" + id + "\"," +
	                    "\"animal\":\"" + animal + "\"," +
	                    "\"count\":\"" + count + "\"," +
	                    "\"regdate\":\"" + regdate + "\"" +
	                    "}";

	            // ElasticSearch에 데이터 색인
	            IndexRequest request = new IndexRequest("education").id(Integer.toString(id)).source(jsonBody, XContentType.JSON);
	            IndexResponse response = client.index(request, RequestOptions.DEFAULT);
	            System.out.println("Indexed document with ID: " + response.getId());
	        }

	    } catch (SQLException | IOException e) {
	        e.printStackTrace();
	    }
	}
	
	
}
