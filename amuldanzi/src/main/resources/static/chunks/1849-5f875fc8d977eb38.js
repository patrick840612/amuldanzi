"use strict";(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[1849],{21849:function(e,t,n){n.d(t,{Z:function(){return ke}});var r=n(32793),o=n(67294),i=n(38331),a=n(23960),s=n(30067),f=n(16600),c=n(57094);function p(e){if(null==e)return window;if("[object Window]"!==e.toString()){var t=e.ownerDocument;return t&&t.defaultView||window}return e}function u(e){return e instanceof p(e).Element||e instanceof Element}function l(e){return e instanceof p(e).HTMLElement||e instanceof HTMLElement}function d(e){return"undefined"!==typeof ShadowRoot&&(e instanceof p(e).ShadowRoot||e instanceof ShadowRoot)}var m=Math.max,h=Math.min,v=Math.round;function y(e,t){void 0===t&&(t=!1);var n=e.getBoundingClientRect(),r=1,o=1;if(l(e)&&t){var i=e.offsetHeight,a=e.offsetWidth;a>0&&(r=v(n.width)/a||1),i>0&&(o=v(n.height)/i||1)}return{width:n.width/r,height:n.height/o,top:n.top/o,right:n.right/r,bottom:n.bottom/o,left:n.left/r,x:n.left/r,y:n.top/o}}function g(e){var t=p(e);return{scrollLeft:t.pageXOffset,scrollTop:t.pageYOffset}}function b(e){return e?(e.nodeName||"").toLowerCase():null}function w(e){return((u(e)?e.ownerDocument:e.document)||window.document).documentElement}function x(e){return y(w(e)).left+g(e).scrollLeft}function O(e){return p(e).getComputedStyle(e)}function E(e){var t=O(e),n=t.overflow,r=t.overflowX,o=t.overflowY;return/auto|scroll|overlay|hidden/.test(n+o+r)}function j(e,t,n){void 0===n&&(n=!1);var r=l(t),o=l(t)&&function(e){var t=e.getBoundingClientRect(),n=v(t.width)/e.offsetWidth||1,r=v(t.height)/e.offsetHeight||1;return 1!==n||1!==r}(t),i=w(t),a=y(e,o),s={scrollLeft:0,scrollTop:0},f={x:0,y:0};return(r||!r&&!n)&&(("body"!==b(t)||E(i))&&(s=function(e){return e!==p(e)&&l(e)?{scrollLeft:(t=e).scrollLeft,scrollTop:t.scrollTop}:g(e);var t}(t)),l(t)?((f=y(t,!0)).x+=t.clientLeft,f.y+=t.clientTop):i&&(f.x=x(i))),{x:a.left+s.scrollLeft-f.x,y:a.top+s.scrollTop-f.y,width:a.width,height:a.height}}function D(e){var t=y(e),n=e.offsetWidth,r=e.offsetHeight;return Math.abs(t.width-n)<=1&&(n=t.width),Math.abs(t.height-r)<=1&&(r=t.height),{x:e.offsetLeft,y:e.offsetTop,width:n,height:r}}function P(e){return"html"===b(e)?e:e.assignedSlot||e.parentNode||(d(e)?e.host:null)||w(e)}function k(e){return["html","body","#document"].indexOf(b(e))>=0?e.ownerDocument.body:l(e)&&E(e)?e:k(P(e))}function A(e,t){var n;void 0===t&&(t=[]);var r=k(e),o=r===(null==(n=e.ownerDocument)?void 0:n.body),i=p(r),a=o?[i].concat(i.visualViewport||[],E(r)?r:[]):r,s=t.concat(a);return o?s:s.concat(A(P(a)))}function R(e){return["table","td","th"].indexOf(b(e))>=0}function L(e){return l(e)&&"fixed"!==O(e).position?e.offsetParent:null}function M(e){for(var t=p(e),n=L(e);n&&R(n)&&"static"===O(n).position;)n=L(n);return n&&("html"===b(n)||"body"===b(n)&&"static"===O(n).position)?t:n||function(e){var t=-1!==navigator.userAgent.toLowerCase().indexOf("firefox");if(-1!==navigator.userAgent.indexOf("Trident")&&l(e)&&"fixed"===O(e).position)return null;var n=P(e);for(d(n)&&(n=n.host);l(n)&&["html","body"].indexOf(b(n))<0;){var r=O(n);if("none"!==r.transform||"none"!==r.perspective||"paint"===r.contain||-1!==["transform","perspective"].indexOf(r.willChange)||t&&"filter"===r.willChange||t&&r.filter&&"none"!==r.filter)return n;n=n.parentNode}return null}(e)||t}var W="top",B="bottom",T="right",H="left",S="auto",Z=[W,B,T,H],C="start",q="end",V="viewport",N="popper",_=Z.reduce((function(e,t){return e.concat([t+"-"+C,t+"-"+q])}),[]),I=[].concat(Z,[S]).reduce((function(e,t){return e.concat([t,t+"-"+C,t+"-"+q])}),[]),U=["beforeRead","read","afterRead","beforeMain","main","afterMain","beforeWrite","write","afterWrite"];function F(e){var t=new Map,n=new Set,r=[];function o(e){n.add(e.name),[].concat(e.requires||[],e.requiresIfExists||[]).forEach((function(e){if(!n.has(e)){var r=t.get(e);r&&o(r)}})),r.push(e)}return e.forEach((function(e){t.set(e.name,e)})),e.forEach((function(e){n.has(e.name)||o(e)})),r}function z(e){var t;return function(){return t||(t=new Promise((function(n){Promise.resolve().then((function(){t=void 0,n(e())}))}))),t}}var X={placement:"bottom",modifiers:[],strategy:"absolute"};function Y(){for(var e=arguments.length,t=new Array(e),n=0;n<e;n++)t[n]=arguments[n];return!t.some((function(e){return!(e&&"function"===typeof e.getBoundingClientRect)}))}function G(e){void 0===e&&(e={});var t=e,n=t.defaultModifiers,r=void 0===n?[]:n,o=t.defaultOptions,i=void 0===o?X:o;return function(e,t,n){void 0===n&&(n=i);var o={placement:"bottom",orderedModifiers:[],options:Object.assign({},X,i),modifiersData:{},elements:{reference:e,popper:t},attributes:{},styles:{}},a=[],s=!1,f={state:o,setOptions:function(n){var s="function"===typeof n?n(o.options):n;c(),o.options=Object.assign({},i,o.options,s),o.scrollParents={reference:u(e)?A(e):e.contextElement?A(e.contextElement):[],popper:A(t)};var p=function(e){var t=F(e);return U.reduce((function(e,n){return e.concat(t.filter((function(e){return e.phase===n})))}),[])}(function(e){var t=e.reduce((function(e,t){var n=e[t.name];return e[t.name]=n?Object.assign({},n,t,{options:Object.assign({},n.options,t.options),data:Object.assign({},n.data,t.data)}):t,e}),{});return Object.keys(t).map((function(e){return t[e]}))}([].concat(r,o.options.modifiers)));return o.orderedModifiers=p.filter((function(e){return e.enabled})),o.orderedModifiers.forEach((function(e){var t=e.name,n=e.options,r=void 0===n?{}:n,i=e.effect;if("function"===typeof i){var s=i({state:o,name:t,instance:f,options:r}),c=function(){};a.push(s||c)}})),f.update()},forceUpdate:function(){if(!s){var e=o.elements,t=e.reference,n=e.popper;if(Y(t,n)){o.rects={reference:j(t,M(n),"fixed"===o.options.strategy),popper:D(n)},o.reset=!1,o.placement=o.options.placement,o.orderedModifiers.forEach((function(e){return o.modifiersData[e.name]=Object.assign({},e.data)}));for(var r=0;r<o.orderedModifiers.length;r++)if(!0!==o.reset){var i=o.orderedModifiers[r],a=i.fn,c=i.options,p=void 0===c?{}:c,u=i.name;"function"===typeof a&&(o=a({state:o,options:p,name:u,instance:f})||o)}else o.reset=!1,r=-1}}},update:z((function(){return new Promise((function(e){f.forceUpdate(),e(o)}))})),destroy:function(){c(),s=!0}};if(!Y(e,t))return f;function c(){a.forEach((function(e){return e()})),a=[]}return f.setOptions(n).then((function(e){!s&&n.onFirstUpdate&&n.onFirstUpdate(e)})),f}}var J={passive:!0};function K(e){return e.split("-")[0]}function Q(e){return e.split("-")[1]}function $(e){return["top","bottom"].indexOf(e)>=0?"x":"y"}function ee(e){var t,n=e.reference,r=e.element,o=e.placement,i=o?K(o):null,a=o?Q(o):null,s=n.x+n.width/2-r.width/2,f=n.y+n.height/2-r.height/2;switch(i){case W:t={x:s,y:n.y-r.height};break;case B:t={x:s,y:n.y+n.height};break;case T:t={x:n.x+n.width,y:f};break;case H:t={x:n.x-r.width,y:f};break;default:t={x:n.x,y:n.y}}var c=i?$(i):null;if(null!=c){var p="y"===c?"height":"width";switch(a){case C:t[c]=t[c]-(n[p]/2-r[p]/2);break;case q:t[c]=t[c]+(n[p]/2-r[p]/2)}}return t}var te={top:"auto",right:"auto",bottom:"auto",left:"auto"};function ne(e){var t,n=e.popper,r=e.popperRect,o=e.placement,i=e.variation,a=e.offsets,s=e.position,f=e.gpuAcceleration,c=e.adaptive,u=e.roundOffsets,l=e.isFixed,d=a.x,m=void 0===d?0:d,h=a.y,y=void 0===h?0:h,g="function"===typeof u?u({x:m,y:y}):{x:m,y:y};m=g.x,y=g.y;var b=a.hasOwnProperty("x"),x=a.hasOwnProperty("y"),E=H,j=W,D=window;if(c){var P=M(n),k="clientHeight",A="clientWidth";if(P===p(n)&&"static"!==O(P=w(n)).position&&"absolute"===s&&(k="scrollHeight",A="scrollWidth"),P=P,o===W||(o===H||o===T)&&i===q)j=B,y-=(l&&P===D&&D.visualViewport?D.visualViewport.height:P[k])-r.height,y*=f?1:-1;if(o===H||(o===W||o===B)&&i===q)E=T,m-=(l&&P===D&&D.visualViewport?D.visualViewport.width:P[A])-r.width,m*=f?1:-1}var R,L=Object.assign({position:s},c&&te),S=!0===u?function(e){var t=e.x,n=e.y,r=window.devicePixelRatio||1;return{x:v(t*r)/r||0,y:v(n*r)/r||0}}({x:m,y:y}):{x:m,y:y};return m=S.x,y=S.y,f?Object.assign({},L,((R={})[j]=x?"0":"",R[E]=b?"0":"",R.transform=(D.devicePixelRatio||1)<=1?"translate("+m+"px, "+y+"px)":"translate3d("+m+"px, "+y+"px, 0)",R)):Object.assign({},L,((t={})[j]=x?y+"px":"",t[E]=b?m+"px":"",t.transform="",t))}var re={left:"right",right:"left",bottom:"top",top:"bottom"};function oe(e){return e.replace(/left|right|bottom|top/g,(function(e){return re[e]}))}var ie={start:"end",end:"start"};function ae(e){return e.replace(/start|end/g,(function(e){return ie[e]}))}function se(e,t){var n=t.getRootNode&&t.getRootNode();if(e.contains(t))return!0;if(n&&d(n)){var r=t;do{if(r&&e.isSameNode(r))return!0;r=r.parentNode||r.host}while(r)}return!1}function fe(e){return Object.assign({},e,{left:e.x,top:e.y,right:e.x+e.width,bottom:e.y+e.height})}function ce(e,t){return t===V?fe(function(e){var t=p(e),n=w(e),r=t.visualViewport,o=n.clientWidth,i=n.clientHeight,a=0,s=0;return r&&(o=r.width,i=r.height,/^((?!chrome|android).)*safari/i.test(navigator.userAgent)||(a=r.offsetLeft,s=r.offsetTop)),{width:o,height:i,x:a+x(e),y:s}}(e)):u(t)?function(e){var t=y(e);return t.top=t.top+e.clientTop,t.left=t.left+e.clientLeft,t.bottom=t.top+e.clientHeight,t.right=t.left+e.clientWidth,t.width=e.clientWidth,t.height=e.clientHeight,t.x=t.left,t.y=t.top,t}(t):fe(function(e){var t,n=w(e),r=g(e),o=null==(t=e.ownerDocument)?void 0:t.body,i=m(n.scrollWidth,n.clientWidth,o?o.scrollWidth:0,o?o.clientWidth:0),a=m(n.scrollHeight,n.clientHeight,o?o.scrollHeight:0,o?o.clientHeight:0),s=-r.scrollLeft+x(e),f=-r.scrollTop;return"rtl"===O(o||n).direction&&(s+=m(n.clientWidth,o?o.clientWidth:0)-i),{width:i,height:a,x:s,y:f}}(w(e)))}function pe(e,t,n){var r="clippingParents"===t?function(e){var t=A(P(e)),n=["absolute","fixed"].indexOf(O(e).position)>=0&&l(e)?M(e):e;return u(n)?t.filter((function(e){return u(e)&&se(e,n)&&"body"!==b(e)})):[]}(e):[].concat(t),o=[].concat(r,[n]),i=o[0],a=o.reduce((function(t,n){var r=ce(e,n);return t.top=m(r.top,t.top),t.right=h(r.right,t.right),t.bottom=h(r.bottom,t.bottom),t.left=m(r.left,t.left),t}),ce(e,i));return a.width=a.right-a.left,a.height=a.bottom-a.top,a.x=a.left,a.y=a.top,a}function ue(e){return Object.assign({},{top:0,right:0,bottom:0,left:0},e)}function le(e,t){return t.reduce((function(t,n){return t[n]=e,t}),{})}function de(e,t){void 0===t&&(t={});var n=t,r=n.placement,o=void 0===r?e.placement:r,i=n.boundary,a=void 0===i?"clippingParents":i,s=n.rootBoundary,f=void 0===s?V:s,c=n.elementContext,p=void 0===c?N:c,l=n.altBoundary,d=void 0!==l&&l,m=n.padding,h=void 0===m?0:m,v=ue("number"!==typeof h?h:le(h,Z)),g=p===N?"reference":N,b=e.rects.popper,x=e.elements[d?g:p],O=pe(u(x)?x:x.contextElement||w(e.elements.popper),a,f),E=y(e.elements.reference),j=ee({reference:E,element:b,strategy:"absolute",placement:o}),D=fe(Object.assign({},b,j)),P=p===N?D:E,k={top:O.top-P.top+v.top,bottom:P.bottom-O.bottom+v.bottom,left:O.left-P.left+v.left,right:P.right-O.right+v.right},A=e.modifiersData.offset;if(p===N&&A){var R=A[o];Object.keys(k).forEach((function(e){var t=[T,B].indexOf(e)>=0?1:-1,n=[W,B].indexOf(e)>=0?"y":"x";k[e]+=R[n]*t}))}return k}function me(e,t,n){return m(e,h(t,n))}function he(e,t,n){return void 0===n&&(n={x:0,y:0}),{top:e.top-t.height-n.y,right:e.right-t.width+n.x,bottom:e.bottom-t.height+n.y,left:e.left-t.width-n.x}}function ve(e){return[W,T,B,H].some((function(t){return e[t]>=0}))}var ye=G({defaultModifiers:[{name:"eventListeners",enabled:!0,phase:"write",fn:function(){},effect:function(e){var t=e.state,n=e.instance,r=e.options,o=r.scroll,i=void 0===o||o,a=r.resize,s=void 0===a||a,f=p(t.elements.popper),c=[].concat(t.scrollParents.reference,t.scrollParents.popper);return i&&c.forEach((function(e){e.addEventListener("scroll",n.update,J)})),s&&f.addEventListener("resize",n.update,J),function(){i&&c.forEach((function(e){e.removeEventListener("scroll",n.update,J)})),s&&f.removeEventListener("resize",n.update,J)}},data:{}},{name:"popperOffsets",enabled:!0,phase:"read",fn:function(e){var t=e.state,n=e.name;t.modifiersData[n]=ee({reference:t.rects.reference,element:t.rects.popper,strategy:"absolute",placement:t.placement})},data:{}},{name:"computeStyles",enabled:!0,phase:"beforeWrite",fn:function(e){var t=e.state,n=e.options,r=n.gpuAcceleration,o=void 0===r||r,i=n.adaptive,a=void 0===i||i,s=n.roundOffsets,f=void 0===s||s,c={placement:K(t.placement),variation:Q(t.placement),popper:t.elements.popper,popperRect:t.rects.popper,gpuAcceleration:o,isFixed:"fixed"===t.options.strategy};null!=t.modifiersData.popperOffsets&&(t.styles.popper=Object.assign({},t.styles.popper,ne(Object.assign({},c,{offsets:t.modifiersData.popperOffsets,position:t.options.strategy,adaptive:a,roundOffsets:f})))),null!=t.modifiersData.arrow&&(t.styles.arrow=Object.assign({},t.styles.arrow,ne(Object.assign({},c,{offsets:t.modifiersData.arrow,position:"absolute",adaptive:!1,roundOffsets:f})))),t.attributes.popper=Object.assign({},t.attributes.popper,{"data-popper-placement":t.placement})},data:{}},{name:"applyStyles",enabled:!0,phase:"write",fn:function(e){var t=e.state;Object.keys(t.elements).forEach((function(e){var n=t.styles[e]||{},r=t.attributes[e]||{},o=t.elements[e];l(o)&&b(o)&&(Object.assign(o.style,n),Object.keys(r).forEach((function(e){var t=r[e];!1===t?o.removeAttribute(e):o.setAttribute(e,!0===t?"":t)})))}))},effect:function(e){var t=e.state,n={popper:{position:t.options.strategy,left:"0",top:"0",margin:"0"},arrow:{position:"absolute"},reference:{}};return Object.assign(t.elements.popper.style,n.popper),t.styles=n,t.elements.arrow&&Object.assign(t.elements.arrow.style,n.arrow),function(){Object.keys(t.elements).forEach((function(e){var r=t.elements[e],o=t.attributes[e]||{},i=Object.keys(t.styles.hasOwnProperty(e)?t.styles[e]:n[e]).reduce((function(e,t){return e[t]="",e}),{});l(r)&&b(r)&&(Object.assign(r.style,i),Object.keys(o).forEach((function(e){r.removeAttribute(e)})))}))}},requires:["computeStyles"]},{name:"offset",enabled:!0,phase:"main",requires:["popperOffsets"],fn:function(e){var t=e.state,n=e.options,r=e.name,o=n.offset,i=void 0===o?[0,0]:o,a=I.reduce((function(e,n){return e[n]=function(e,t,n){var r=K(e),o=[H,W].indexOf(r)>=0?-1:1,i="function"===typeof n?n(Object.assign({},t,{placement:e})):n,a=i[0],s=i[1];return a=a||0,s=(s||0)*o,[H,T].indexOf(r)>=0?{x:s,y:a}:{x:a,y:s}}(n,t.rects,i),e}),{}),s=a[t.placement],f=s.x,c=s.y;null!=t.modifiersData.popperOffsets&&(t.modifiersData.popperOffsets.x+=f,t.modifiersData.popperOffsets.y+=c),t.modifiersData[r]=a}},{name:"flip",enabled:!0,phase:"main",fn:function(e){var t=e.state,n=e.options,r=e.name;if(!t.modifiersData[r]._skip){for(var o=n.mainAxis,i=void 0===o||o,a=n.altAxis,s=void 0===a||a,f=n.fallbackPlacements,c=n.padding,p=n.boundary,u=n.rootBoundary,l=n.altBoundary,d=n.flipVariations,m=void 0===d||d,h=n.allowedAutoPlacements,v=t.options.placement,y=K(v),g=f||(y===v||!m?[oe(v)]:function(e){if(K(e)===S)return[];var t=oe(e);return[ae(e),t,ae(t)]}(v)),b=[v].concat(g).reduce((function(e,n){return e.concat(K(n)===S?function(e,t){void 0===t&&(t={});var n=t,r=n.placement,o=n.boundary,i=n.rootBoundary,a=n.padding,s=n.flipVariations,f=n.allowedAutoPlacements,c=void 0===f?I:f,p=Q(r),u=p?s?_:_.filter((function(e){return Q(e)===p})):Z,l=u.filter((function(e){return c.indexOf(e)>=0}));0===l.length&&(l=u);var d=l.reduce((function(t,n){return t[n]=de(e,{placement:n,boundary:o,rootBoundary:i,padding:a})[K(n)],t}),{});return Object.keys(d).sort((function(e,t){return d[e]-d[t]}))}(t,{placement:n,boundary:p,rootBoundary:u,padding:c,flipVariations:m,allowedAutoPlacements:h}):n)}),[]),w=t.rects.reference,x=t.rects.popper,O=new Map,E=!0,j=b[0],D=0;D<b.length;D++){var P=b[D],k=K(P),A=Q(P)===C,R=[W,B].indexOf(k)>=0,L=R?"width":"height",M=de(t,{placement:P,boundary:p,rootBoundary:u,altBoundary:l,padding:c}),q=R?A?T:H:A?B:W;w[L]>x[L]&&(q=oe(q));var V=oe(q),N=[];if(i&&N.push(M[k]<=0),s&&N.push(M[q]<=0,M[V]<=0),N.every((function(e){return e}))){j=P,E=!1;break}O.set(P,N)}if(E)for(var U=function(e){var t=b.find((function(t){var n=O.get(t);if(n)return n.slice(0,e).every((function(e){return e}))}));if(t)return j=t,"break"},F=m?3:1;F>0;F--){if("break"===U(F))break}t.placement!==j&&(t.modifiersData[r]._skip=!0,t.placement=j,t.reset=!0)}},requiresIfExists:["offset"],data:{_skip:!1}},{name:"preventOverflow",enabled:!0,phase:"main",fn:function(e){var t=e.state,n=e.options,r=e.name,o=n.mainAxis,i=void 0===o||o,a=n.altAxis,s=void 0!==a&&a,f=n.boundary,c=n.rootBoundary,p=n.altBoundary,u=n.padding,l=n.tether,d=void 0===l||l,v=n.tetherOffset,y=void 0===v?0:v,g=de(t,{boundary:f,rootBoundary:c,padding:u,altBoundary:p}),b=K(t.placement),w=Q(t.placement),x=!w,O=$(b),E="x"===O?"y":"x",j=t.modifiersData.popperOffsets,P=t.rects.reference,k=t.rects.popper,A="function"===typeof y?y(Object.assign({},t.rects,{placement:t.placement})):y,R="number"===typeof A?{mainAxis:A,altAxis:A}:Object.assign({mainAxis:0,altAxis:0},A),L=t.modifiersData.offset?t.modifiersData.offset[t.placement]:null,S={x:0,y:0};if(j){if(i){var Z,q="y"===O?W:H,V="y"===O?B:T,N="y"===O?"height":"width",_=j[O],I=_+g[q],U=_-g[V],F=d?-k[N]/2:0,z=w===C?P[N]:k[N],X=w===C?-k[N]:-P[N],Y=t.elements.arrow,G=d&&Y?D(Y):{width:0,height:0},J=t.modifiersData["arrow#persistent"]?t.modifiersData["arrow#persistent"].padding:{top:0,right:0,bottom:0,left:0},ee=J[q],te=J[V],ne=me(0,P[N],G[N]),re=x?P[N]/2-F-ne-ee-R.mainAxis:z-ne-ee-R.mainAxis,oe=x?-P[N]/2+F+ne+te+R.mainAxis:X+ne+te+R.mainAxis,ie=t.elements.arrow&&M(t.elements.arrow),ae=ie?"y"===O?ie.clientTop||0:ie.clientLeft||0:0,se=null!=(Z=null==L?void 0:L[O])?Z:0,fe=_+oe-se,ce=me(d?h(I,_+re-se-ae):I,_,d?m(U,fe):U);j[O]=ce,S[O]=ce-_}if(s){var pe,ue="x"===O?W:H,le="x"===O?B:T,he=j[E],ve="y"===E?"height":"width",ye=he+g[ue],ge=he-g[le],be=-1!==[W,H].indexOf(b),we=null!=(pe=null==L?void 0:L[E])?pe:0,xe=be?ye:he-P[ve]-k[ve]-we+R.altAxis,Oe=be?he+P[ve]+k[ve]-we-R.altAxis:ge,Ee=d&&be?function(e,t,n){var r=me(e,t,n);return r>n?n:r}(xe,he,Oe):me(d?xe:ye,he,d?Oe:ge);j[E]=Ee,S[E]=Ee-he}t.modifiersData[r]=S}},requiresIfExists:["offset"]},{name:"arrow",enabled:!0,phase:"main",fn:function(e){var t,n=e.state,r=e.name,o=e.options,i=n.elements.arrow,a=n.modifiersData.popperOffsets,s=K(n.placement),f=$(s),c=[H,T].indexOf(s)>=0?"height":"width";if(i&&a){var p=function(e,t){return ue("number"!==typeof(e="function"===typeof e?e(Object.assign({},t.rects,{placement:t.placement})):e)?e:le(e,Z))}(o.padding,n),u=D(i),l="y"===f?W:H,d="y"===f?B:T,m=n.rects.reference[c]+n.rects.reference[f]-a[f]-n.rects.popper[c],h=a[f]-n.rects.reference[f],v=M(i),y=v?"y"===f?v.clientHeight||0:v.clientWidth||0:0,g=m/2-h/2,b=p[l],w=y-u[c]-p[d],x=y/2-u[c]/2+g,O=me(b,x,w),E=f;n.modifiersData[r]=((t={})[E]=O,t.centerOffset=O-x,t)}},effect:function(e){var t=e.state,n=e.options.element,r=void 0===n?"[data-popper-arrow]":n;null!=r&&("string"!==typeof r||(r=t.elements.popper.querySelector(r)))&&se(t.elements.popper,r)&&(t.elements.arrow=r)},requires:["popperOffsets"],requiresIfExists:["preventOverflow"]},{name:"hide",enabled:!0,phase:"main",requiresIfExists:["preventOverflow"],fn:function(e){var t=e.state,n=e.name,r=t.rects.reference,o=t.rects.popper,i=t.modifiersData.preventOverflow,a=de(t,{elementContext:"reference"}),s=de(t,{altBoundary:!0}),f=he(a,r),c=he(s,o,i),p=ve(f),u=ve(c);t.modifiersData[n]={referenceClippingOffsets:f,popperEscapeOffsets:c,isReferenceHidden:p,hasPopperEscaped:u},t.attributes.popper=Object.assign({},t.attributes.popper,{"data-popper-reference-hidden":p,"data-popper-escaped":u})}}]}),ge=n(78385),be=n(85893);const we=["anchorEl","children","direction","disablePortal","modifiers","open","ownerState","placement","popperOptions","popperRef","TransitionProps"],xe=["anchorEl","children","container","direction","disablePortal","keepMounted","modifiers","open","placement","popperOptions","popperRef","style","transition"];function Oe(e){return"function"===typeof e?e():e}const Ee={},je=o.forwardRef((function(e,t){const{anchorEl:n,children:r,direction:c,disablePortal:p,modifiers:u,open:l,placement:d,popperOptions:m,popperRef:h,TransitionProps:v}=e,y=(0,a.Z)(e,we),g=o.useRef(null),b=(0,s.Z)(g,t),w=o.useRef(null),x=(0,s.Z)(w,h),O=o.useRef(x);(0,f.Z)((()=>{O.current=x}),[x]),o.useImperativeHandle(h,(()=>w.current),[]);const E=function(e,t){if("ltr"===t)return e;switch(e){case"bottom-end":return"bottom-start";case"bottom-start":return"bottom-end";case"top-end":return"top-start";case"top-start":return"top-end";default:return e}}(d,c),[j,D]=o.useState(E);o.useEffect((()=>{w.current&&w.current.forceUpdate()})),(0,f.Z)((()=>{if(!n||!l)return;Oe(n);let e=[{name:"preventOverflow",options:{altBoundary:p}},{name:"flip",options:{altBoundary:p}},{name:"onUpdate",enabled:!0,phase:"afterWrite",fn:({state:e})=>{D(e.placement)}}];null!=u&&(e=e.concat(u)),m&&null!=m.modifiers&&(e=e.concat(m.modifiers));const t=ye(Oe(n),g.current,(0,i.Z)({placement:E},m,{modifiers:e}));return O.current(t),()=>{t.destroy(),O.current(null)}}),[n,p,u,l,m,E]);const P={placement:j};return null!==v&&(P.TransitionProps=v),(0,be.jsx)("div",(0,i.Z)({ref:b,role:"tooltip"},y,{children:"function"===typeof r?r(P):r}))}));var De=o.forwardRef((function(e,t){const{anchorEl:n,children:r,container:s,direction:f="ltr",disablePortal:p=!1,keepMounted:u=!1,modifiers:l,open:d,placement:m="bottom",popperOptions:h=Ee,popperRef:v,style:y,transition:g=!1}=e,b=(0,a.Z)(e,xe),[w,x]=o.useState(!0);if(!u&&!d&&(!g||w))return null;const O=s||(n?(0,c.Z)(Oe(n)).body:void 0);return(0,be.jsx)(ge.Z,{disablePortal:p,container:O,children:(0,be.jsx)(je,(0,i.Z)({anchorEl:n,direction:f,disablePortal:p,modifiers:l,ref:t,open:g?!w:d,placement:m,popperOptions:h,popperRef:v},b,{style:(0,i.Z)({position:"fixed",top:0,left:0,display:d||!u||g&&!w?null:"none"},y),TransitionProps:g?{in:d,onEnter:()=>{x(!1)},onExited:()=>{x(!0)}}:null,children:r}))})})),Pe=n(34168);var ke=o.forwardRef((function(e,t){const n=(0,Pe.Z)();return(0,be.jsx)(De,(0,r.Z)({direction:null==n?void 0:n.direction},e,{ref:t}))}))}}]);