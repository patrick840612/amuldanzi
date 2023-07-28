package com.amuldanzi.controller;

import org.apache.http.HttpHost;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main")
public class HeaderController {


    private static final String ES_HOST = "localhost";
    private static final int ES_PORT = 9200;
    private static final String COMMUNITY_INDEX_NAME = "community"; // 데이터를 색인한 ElasticSearch의 인덱스 이름
    private static final String NOTICE_INDEX_NAME = "notice";
    
	
    @GetMapping("/search")
    public void searchResult(Model model, @RequestParam(name = "query") String query) {

        try (RestHighLevelClient client = new RestHighLevelClient(
                RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

            // 검색어를 기반으로 ElasticSearch에 커뮤니티 검색 요청
            SearchRequest communitySearchRequest = new SearchRequest(COMMUNITY_INDEX_NAME);
            SearchSourceBuilder communitySearchSourceBuilder = new SearchSourceBuilder();
            communitySearchSourceBuilder.query(QueryBuilders.matchAllQuery());
            communitySearchSourceBuilder.query(QueryBuilders.matchQuery("comm_title", query)); // 제목에서 검색
            communitySearchRequest.source(communitySearchSourceBuilder);

            // 검색어를 기반으로 ElasticSearch에 공지 검색 요청
            SearchRequest noticeSearchRequest = new SearchRequest(NOTICE_INDEX_NAME);
            SearchSourceBuilder noticeSearchSourceBuilder = new SearchSourceBuilder();
            communitySearchSourceBuilder.query(QueryBuilders.matchAllQuery());
            noticeSearchSourceBuilder.query(QueryBuilders.matchQuery("title", query)); // 제목에서 검색
            noticeSearchRequest.source(noticeSearchSourceBuilder);

            // 커뮤니티 검색 결과를 받아옴
            SearchResponse communityResponse = client.search(communitySearchRequest, RequestOptions.DEFAULT);
            SearchHit[] communityHits = communityResponse.getHits().getHits();

            // 공지 검색 결과를 받아옴
            SearchResponse noticeResponse = client.search(noticeSearchRequest, RequestOptions.DEFAULT);
            SearchHit[] noticeHits = noticeResponse.getHits().getHits();

            // 검색 결과를 모델에 추가하여 View에 전달
            model.addAttribute("communityResults", communityHits);
            model.addAttribute("noticeResults", noticeHits);
 
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
	
	
}
