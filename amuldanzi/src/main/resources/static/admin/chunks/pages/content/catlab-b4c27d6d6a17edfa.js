(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[2610],{88022:function(t,e,n){(window.__NEXT_P=window.__NEXT_P||[]).push(["/content/catlab",function(){return n(30735)}])},58723:function(t,e,n){"use strict";var a=n(85893),o=n(57833),r=n(13236),i=n.n(r);e.Z=function(t){return(0,a.jsxs)("div",{className:i().contentLayoutWrapper,children:[(0,a.jsx)(o.default,{}),t.children]})}},5625:function(t,e,n){"use strict";var a=n(85893),o=n(58447);e.Z=function(t){var e=t.currentPage,n=t.pageSize,r=t.totalCount,i=t.handlePageChange;return(0,a.jsx)(o.Z,{activePage:e,itemsCountPerPage:n,totalItemsCount:r,pageRangeDisplayed:5,prevPageText:"\xb7\xb7\xb7",nextPageText:"\xb7\xb7\xb7",firstPageText:"\u2039",lastPageText:"\u203a",onChange:i})}},29146:function(t,e,n){"use strict";var a=n(85893),o=n(10986),r=n.n(o);e.Z=function(t){var e=t.textData,n=/(<([^>]+)>)/gi;return(0,a.jsx)(a.Fragment,{children:e&&e.map((function(t,e){return(0,a.jsxs)("div",{className:r().textContentBox,onClick:function(){return window.open("".concat(t.guid.replace("dev.","")))},children:[(0,a.jsxs)("div",{className:r().textContent,children:[(0,a.jsx)("div",{className:r().textContentTitle,children:t.title}),(0,a.jsx)("div",{className:r().textContentText,children:t.content_html.replace(n,"")})]}),(0,a.jsx)("div",{className:r().textContentImgWrapper,children:(0,a.jsx)("img",{src:null===t.featured_media?"/image/image_not_found.jpg":t.featured_media,className:r().textContentListImg})})]},e)}))})}},30735:function(t,e,n){"use strict";n.r(e);var a=n(85893),o=n(67294),r=n(11163),i=(n(9669),n(88767)),c=n(42546),s=n(58723),u=n(29146),l=n(5625),d=n(9008);e.default=function(){var t=(0,r.useRouter)(),e=(0,o.useState)([]),n=(e[0],e[1],(0,o.useState)(10)),p=(n[0],n[1],(0,o.useState)(0)),x=(p[0],p[1],(0,o.useState)(1)),m=x[0],_=x[1],g=(0,i.useQuery)(["catData",{currentPage:m}],(function(){return(0,c.M0)(m).then(t.push("/content/catlab?p=".concat(m)))}),{keepPreviousData:!1,enabled:!!m}),f=g.data,h=(g.isLoading,g.isError,g.error,window.location.href?window.location.href:"");return(0,a.jsxs)(a.Fragment,{children:[(0,a.jsxs)(d.default,{children:[(0,a.jsx)("title",{children:"\ubc18\ub824\ub3d9\ubb3c \ucf58\ud150\uce20 - \ube44\ub9c8\uc774\ud3ab"}),(0,a.jsx)("meta",{property:"og:locale",content:"ko_KR"}),(0,a.jsx)("meta",{property:"og:site_name",content:"\ube44\ub9c8\uc774\ud3ab"}),(0,a.jsx)("meta",{property:"og:type",content:"website"}),(0,a.jsx)("meta",{property:"og:url",content:h}),(0,a.jsx)("meta",{property:"og:title",content:"\ubc18\ub824\ub3d9\ubb3c \ucf58\ud150\uce20 - \ube44\ub9c8\uc774\ud3ab"}),(0,a.jsx)("meta",{property:"og:image",content:"https://bff-images.bemypet.kr/static/assets/og_image.png"}),(0,a.jsx)("meta",{property:"og:description",content:"\ubc18\ub824\ub3d9\ubb3c \uc9c0\uc2dd\uc815\ubcf4 \ucf58\ud150\uce20, \uc81c\ud488 \ub9ac\ubdf0 \ub4f1 \ub2e4\uc591\ud55c \ubc18\ub824\ub3d9\ubb3c \ucf58\ud150\uce20\ub97c \ud655\uc778\ud574\ubcf4\uc138\uc694"})]}),(0,a.jsxs)(s.Z,{children:[(0,a.jsx)(u.Z,{textData:null===f||void 0===f?void 0:f.results}),(0,a.jsx)(l.Z,{currentPage:m,pageSize:10,totalCount:null===f||void 0===f?void 0:f.count,handlePageChange:function(t){_(t)}})]})]})}},57833:function(t,e,n){"use strict";n.r(e);var a=n(85893),o=n(11163),r=n(41664),i=n(44928),c=n.n(i),s=[{id:"menu01",path:"/content",name:"\ucd94\ucc9c"},{id:"menu02",path:"/content/doglab",name:"\uac15\uc544\uc9c0 \uc5f0\uad6c\uc18c"},{id:"menu03",path:"/content/catlab",name:"\uace0\uc591\uc774 \uc5f0\uad6c\uc18c"},{id:"menu04",path:"/content/productlab",name:"\uc81c\ud488 \uc5f0\uad6c\uc18c"},{id:"menu05",path:"/content/jaebo",name:"\uc81c\ubcf4"},{id:"menu06",path:"/content/news",name:"\ub274\uc2a4/\ube0c\ub79c\ub4dc"}];e.default=function(){var t=(0,o.useRouter)();return(0,a.jsx)("nav",{className:c().contentHeaderWrapper,children:(0,a.jsx)("ul",{children:s.map((function(e){return(0,a.jsx)("li",{children:(0,a.jsx)(r.default,{href:e.path,children:(0,a.jsx)("a",{className:e.path==t.pathname?c().activeMenu:c().defaultMenu,children:e.name})})},e.id)}))})})}},44928:function(t){t.exports={contentHeaderWrapper:"contentHeader_contentHeaderWrapper__VKdru",defaultMenu:"contentHeader_defaultMenu__IJ39V",activeMenu:"contentHeader_activeMenu__M617u"}},13236:function(t){t.exports={contentLayoutWrapper:"contentLayout_contentLayoutWrapper__aBRTj"}},10986:function(t){t.exports={textContentBox:"textContent_textContentBox__9iWXJ",textContent:"textContent_textContent__XoWAM",textContentTitle:"textContent_textContentTitle__RyvB1",textContentText:"textContent_textContentText__oFv1A",textContentImgWrapper:"textContent_textContentImgWrapper__f42RO",textContentListImg:"textContent_textContentListImg__90K0A"}}},function(t){t.O(0,[8695,9774,2888,179],(function(){return e=88022,t(t.s=e);var e}));var e=t.O();_N_E=e}]);