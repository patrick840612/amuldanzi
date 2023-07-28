package com.amuldanzi.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
public class MariaDBToElasticSearch {

	
	// ElasticSearch 클러스터 호스트 및 포트 설정 (주소는 적절하게 변경)
    private static final String ES_HOST = "localhost";
    private static final int ES_PORT = 9200;

    // MariaDB 접속 정보
    private static final String DB_URL = "jdbc:mariadb://localhost:3306/final"; // 데이터베이스 이름으로 변경
    private static final String DB_USER = "amul";
    private static final String DB_PASSWORD = "danzi";

    // 데이터를 색인할 인덱스 이름
    private static final String INDEX_NAME = "community";

    public void indexDataFromMariaDB() {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement statement = connection.createStatement();
             RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

            String sql = "SELECT comm_no, answer_count, comm_content, comm_date, comm_title, id FROM community";
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int commNo = resultSet.getInt("comm_no");
                int answerCount = resultSet.getInt("answer_count");
                String commContent = resultSet.getString("comm_content");
                Date commDate = resultSet.getDate("comm_date");
                String commTitle = resultSet.getString("comm_title");
                String id = resultSet.getString("id");

                // JSON 형식으로 데이터 변환
                String jsonBody = "{" +
                        "\"comm_no\":\"" + commNo + "\"," +
                        "\"answer_count\":\"" + answerCount + "\"," +
                        "\"comm_content\":\"" + commContent + "\"," +
                        "\"comm_date\":\"" + commDate + "\"," +
                        "\"comm_title\":\"" + commTitle + "\"," +
                        "\"id\":\"" + id + "\"" +
                        "}";

                // ElasticSearch에 데이터 색인
                IndexRequest request = new IndexRequest(INDEX_NAME).id(Integer.toString(commNo)).source(jsonBody, XContentType.JSON);
                IndexResponse response = client.index(request, RequestOptions.DEFAULT);
                System.out.println("Indexed document with ID: " + response.getId());
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteDataFromElasticsearch(int commNo) {
        try (RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {
            // ElasticSearch에서 데이터 삭제
            DeleteRequest request = new DeleteRequest(INDEX_NAME, Integer.toString(commNo));
            DeleteResponse response = client.delete(request, RequestOptions.DEFAULT);
            System.out.println("Deleted document with ID: " + response.getId());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
    public static void main(String[] args) {
        MariaDBToElasticSearch indexer = new MariaDBToElasticSearch();
        indexer.indexDataFromMariaDB();
        
     // Elasticsearch에서 데이터를 삭제하려면 해당 데이터의 comm_no를 인자로 전달합니다.
        int commNoToDelete = 39; // 삭제하려는 데이터의 comm_no를 설정하세요.
        indexer.deleteDataFromElasticsearch(commNoToDelete);
        
    }
	
	
	
}
