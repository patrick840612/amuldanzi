(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[1645],{73949:function(e,n,t){(window.__NEXT_P=window.__NEXT_P||[]).push(["/content/jaebo",function(){return t(48343)}])},58723:function(e,n,t){"use strict";var a=t(85893),o=t(57833),i=t(13236),r=t.n(i);n.Z=function(e){return(0,a.jsxs)("div",{className:r().contentLayoutWrapper,children:[(0,a.jsx)(o.default,{}),e.children]})}},79987:function(e,n,t){"use strict";var a=t(85893),o=t(25675),i=t(70043),r=t.n(i);n.Z=function(e){var n=e.mainData;return(0,a.jsx)(a.Fragment,{children:n&&n.map((function(e,n){return(0,a.jsxs)("div",{className:r().mainContentBox,onClick:function(){return window.open("".concat(e.guid.replace("dev.","").replace("#038;","")))},children:[(0,a.jsx)("div",{className:r().mainImgWrapper,children:(0,a.jsx)(o.default,{sizes:"700px",width:470,height:300,layout:"responsive",src:null===e.featured_media?"/image/image_not_found.jpg":e.featured_media,alt:"main_image",placeholder:"blur",blurDataURL:"data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAFklEQVR42mN8//HLfwYiAOOoQvoqBABbWyZJf74GZgAAAABJRU5ErkJggg==",className:r().mainImg})}),(0,a.jsxs)("div",{className:r().mainContent,children:[(0,a.jsx)("div",{className:r().mainTitle,children:e.title}),(0,a.jsx)("div",{className:r().mainAuthor,children:null===e.author?"\ube44\ub9c8\uc774\ud3ab \ub9e4\ub2c8\uc800":e.author.display_name})]})]},n)}))})}},5625:function(e,n,t){"use strict";var a=t(85893),o=t(58447);n.Z=function(e){var n=e.currentPage,t=e.pageSize,i=e.totalCount,r=e.handlePageChange;return(0,a.jsx)(o.Z,{activePage:n,itemsCountPerPage:t,totalItemsCount:i,pageRangeDisplayed:5,prevPageText:"\xb7\xb7\xb7",nextPageText:"\xb7\xb7\xb7",firstPageText:"\u2039",lastPageText:"\u203a",onChange:r})}},57833:function(e,n,t){"use strict";t.r(n);var a=t(85893),o=t(11163),i=t(41664),r=t(44928),c=t.n(r),s=[{id:"menu01",path:"/content",name:"\ucd94\ucc9c"},{id:"menu02",path:"/content/doglab",name:"\uac15\uc544\uc9c0 \uc5f0\uad6c\uc18c"},{id:"menu03",path:"/content/catlab",name:"\uace0\uc591\uc774 \uc5f0\uad6c\uc18c"},{id:"menu04",path:"/content/productlab",name:"\uc81c\ud488 \uc5f0\uad6c\uc18c"},{id:"menu05",path:"/content/jaebo",name:"\uc81c\ubcf4"},{id:"menu06",path:"/content/news",name:"\ub274\uc2a4/\ube0c\ub79c\ub4dc"}];n.default=function(){var e=(0,o.useRouter)();return(0,a.jsx)("nav",{className:c().contentHeaderWrapper,children:(0,a.jsx)("ul",{children:s.map((function(n){return(0,a.jsx)("li",{children:(0,a.jsx)(i.default,{href:n.path,children:(0,a.jsx)("a",{className:n.path==e.pathname?c().activeMenu:c().defaultMenu,children:n.name})})},n.id)}))})})}},48343:function(e,n,t){"use strict";t.r(n);var a=t(85893),o=t(67294),i=t(11163),r=(t(9669),t(88767)),c=t(42546),s=t(58723),u=t(5625),l=t(79987),d=t(87037),m=t.n(d),p=t(9008);n.default=function(){var e=(0,i.useRouter)(),n=(0,o.useState)([]),t=(n[0],n[1],(0,o.useState)(10)),d=(t[0],t[1],(0,o.useState)(0)),g=(d[0],d[1],(0,o.useState)(1)),h=g[0],_=g[1],f=(0,r.useQuery)(["jaeboData",{currentPage:h}],(function(){return(0,c.nk)(h).then(e.push("/content/jaebo?p=".concat(h)))}),{keepPreviousData:!1,enabled:!!h}),x=f.data,j=(f.isLoading,f.isError,f.error,window.location.href?window.location.href:"");return(0,a.jsxs)(a.Fragment,{children:[(0,a.jsxs)(p.default,{children:[(0,a.jsx)("title",{children:"\ubc18\ub824\ub3d9\ubb3c \ucf58\ud150\uce20 - \ube44\ub9c8\uc774\ud3ab"}),(0,a.jsx)("meta",{property:"og:locale",content:"ko_KR"}),(0,a.jsx)("meta",{property:"og:site_name",content:"\ube44\ub9c8\uc774\ud3ab"}),(0,a.jsx)("meta",{property:"og:type",content:"website"}),(0,a.jsx)("meta",{property:"og:url",content:j}),(0,a.jsx)("meta",{property:"og:title",content:"\ubc18\ub824\ub3d9\ubb3c \ucf58\ud150\uce20 - \ube44\ub9c8\uc774\ud3ab"}),(0,a.jsx)("meta",{property:"og:image",content:"https://bff-images.bemypet.kr/static/assets/og_image.png"}),(0,a.jsx)("meta",{property:"og:description",content:"\ubc18\ub824\ub3d9\ubb3c \uc9c0\uc2dd\uc815\ubcf4 \ucf58\ud150\uce20, \uc81c\ud488 \ub9ac\ubdf0 \ub4f1 \ub2e4\uc591\ud55c \ubc18\ub824\ub3d9\ubb3c \ucf58\ud150\uce20\ub97c \ud655\uc778\ud574\ubcf4\uc138\uc694"})]}),(0,a.jsxs)(s.Z,{children:[(0,a.jsx)("div",{className:m().contentMainContainer,children:(0,a.jsx)(l.Z,{mainData:null===x||void 0===x?void 0:x.results})}),(0,a.jsx)(u.Z,{currentPage:h,pageSize:10,totalCount:null===x||void 0===x?void 0:x.count,handlePageChange:function(e){_(e)}})]})]})}},44928:function(e){e.exports={contentHeaderWrapper:"contentHeader_contentHeaderWrapper__VKdru",defaultMenu:"contentHeader_defaultMenu__IJ39V",activeMenu:"contentHeader_activeMenu__M617u"}},13236:function(e){e.exports={contentLayoutWrapper:"contentLayout_contentLayoutWrapper__aBRTj"}},87037:function(e){e.exports={contentMainContainer:"contentPage_contentMainContainer__lrt_W"}},70043:function(e){e.exports={mainContentBox:"mainContent_mainContentBox__shdST",mainImg:"mainContent_mainImg__dWbCy",mainContent:"mainContent_mainContent__w_Buk",mainTitle:"mainContent_mainTitle__8iW62",mainAuthor:"mainContent_mainAuthor__kKyGl"}}},function(e){e.O(0,[8695,5675,9774,2888,179],(function(){return n=73949,e(e.s=n);var n}));var n=e.O();_N_E=n}]);