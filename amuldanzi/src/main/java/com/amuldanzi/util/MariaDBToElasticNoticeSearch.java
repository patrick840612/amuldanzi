package com.amuldanzi.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.http.HttpHost;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.springframework.stereotype.Component;

@Component
public class MariaDBToElasticNoticeSearch {

	
	// ElasticSearch 클러스터 호스트 및 포트 설정 (주소는 적절하게 변경)
    private static final String ES_HOST = "localhost";
    private static final int ES_PORT = 9200;

    // MariaDB 접속 정보
    private static final String DB_URL = "jdbc:mariadb://localhost:3306/final"; // 데이터베이스 이름으로 변경
    private static final String DB_USER = "amul";
    private static final String DB_PASSWORD = "danzi";

    // 데이터를 색인할 인덱스 이름
    private static final String INDEX_NAME = "notice";

    public void indexDataFromMariaDB() {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement statement = connection.createStatement();
             RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

            String sql = "SELECT id, category, content, title FROM notice";
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String category = resultSet.getString("category"); 
                String noticeTitle  = resultSet.getString("title");  

                // JSON 형식으로 데이터 변환
                String jsonBody = "{" +
                        "\"id\":\"" + id + "\"," +
                        "\"category\":\"" + category + "\"," + 
                        "\"title\":\"" + noticeTitle + "\"" +  
                        "}";

                // ElasticSearch에 데이터 색인
                IndexRequest request = new IndexRequest(INDEX_NAME).id(Integer.toString(id)).source(jsonBody, XContentType.JSON);
                IndexResponse response = client.index(request, RequestOptions.DEFAULT);
                System.out.println("Indexed document with ID: " + response.getId());
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        MariaDBToElasticNoticeSearch indexer = new MariaDBToElasticNoticeSearch();
        indexer.indexDataFromMariaDB();
    }
	
	
	
}
