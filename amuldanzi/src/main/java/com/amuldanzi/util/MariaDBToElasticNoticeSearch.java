package com.amuldanzi.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.http.HttpHost;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.core.TimeValue;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
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
    
    public void searchDataFromElasticsearch() {
        try (RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {
            // Elasticsearch 검색 요청
            SearchRequest searchRequest = new SearchRequest(INDEX_NAME);
            SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

            // 더 많은 결과를 얻기 위해 size를 설정합니다 (예: 100)
            int size = 100;
            searchSourceBuilder.size(size);

            // 쿼리 정의 (검색 요구 사항에 맞게 사용자 정의 가능)
            searchSourceBuilder.query(QueryBuilders.matchAllQuery());

            // 검색 요청에 대한 타임아웃 설정 (예: 30초)
            searchSourceBuilder.timeout(TimeValue.timeValueSeconds(30));

            searchRequest.source(searchSourceBuilder);

            // 검색 수행
            SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

            // 검색 결과 처리
            SearchHit[] hits = searchResponse.getHits().getHits();
            for (SearchHit hit : hits) {
                System.out.println("ID: " + hit.getId() + ", Source: " + hit.getSourceAsString());
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        MariaDBToElasticNoticeSearch indexer = new MariaDBToElasticNoticeSearch();
        indexer.indexDataFromMariaDB();
        
        
     // Elasticsearch에서 데이터를 삭제하려면 해당 데이터의 comm_no를 인자로 전달합니다.
        int commNoToDelete = 6; // 삭제하려는 데이터의 comm_no를 설정하세요.
        indexer.deleteDataFromElasticsearch(commNoToDelete);
         
        indexer.searchDataFromElasticsearch();
        
        
    }
	
	
	
}
