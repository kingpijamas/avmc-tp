/* 
 * DynAlloy translator options 
 * --------------------------- 
 * assertionId= check_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0
 * loopUnroll= 4
 * removeQuantifiers= true
 * strictUnrolling= false
 * build_dynalloy_trace= false
 */ 

//-------------- prelude--------------//
module moduleId
open util/integer
open util/sequniv as sequniv
one sig null {}
fun fun_reach[h: univ, 
              type: set univ, 
              field: univ -> univ
]: set univ { 
  h.*(field & type->(type+null)) & type 
}

fun fun_weak_reach[h: univ, 
              type: set univ, 
              field: univ -> univ
]: set univ { 
  h.*(field) & type 
}

one
sig AssertionFailureLit extends java_lang_Throwable {}
abstract sig boolean {}
one sig true extends boolean {}
one sig false extends boolean {}
abstract sig char {}
pred TruePred[] {}
pred FalsePred[] { not TruePred[] }
pred equ[l,r:univ] {l=r}
pred neq[l,r:univ] {l!=r}
fun shl[l,r: Int]: Int { l << r } 
fun sshr[l,r: Int]: Int { l >> r } 
fun ushr[l,r: Int]: Int { l >>> r } 

fun fun_univ_equals[
  l:univ, 
  r: univ 
]: boolean { 
  (equ[l,r]) => true else false 
} 

fun fun_set_add[
  l: set univ,
  e: univ
]: set univ { 
  l+e 
} 

fun fun_set_remove[
  l: set univ,
  e: univ
]: set univ {
  l-e
}
fun fun_set_contains[
  l: set univ,
  e: univ
]: boolean {
  (e in l) => true else false 
}
pred isSubset[
  l: set univ,
  r: set univ
] {
  (l in r) 
}
pred isNotSubset[
  l: set univ,
  r: set univ
] {
  (l !in r) 
}
fun fun_set_size[s: set univ]: Int { #s } 

fun fun_not_empty_set[s: set univ]: boolean { (no s) => false else true } 

fun fun_set_is_empty[s: set univ]: boolean { (no s) => true else false }
pred pred_empty_set[l: set univ] { (no l) }
pred pred_set_some[l: set univ] { some l }
pred pred_set_one[l: set univ] { one l }
pred pred_set_lone[l: set univ] { lone l }
pred pred_Object_subset[
  s: set univ
] {
  s in java_lang_Object+null
}
fun fun_set_intersection[
  l: set univ,
  r: set univ
]: set univ {
  l & r 
} 
fun fun_set_difference[
  l: set univ,
  r: set univ
]: set univ {
  l - r 
} 
fun fun_rel_difference[ 
  rel: univ -> univ, 
  l: univ,
  r: univ
]: univ->univ {
 rel - (l->r) 
}
fun fun_rel_add[ 
  rel: univ -> univ, 
  l: univ,
  r: univ
]: univ->univ {
 rel + (l->r) 
}
fun fun_set_sum[
  s: set Int
]: Int {
  sum s 
}
pred pred_empty_list[l: Int -> univ] { (no l) }
fun fun_list_add[
  l: Int -> univ,
  e: univ
]: Int -> univ {
  l + (Int[#(l.univ)]->e)
} 

fun fun_list_get[
  l: Int -> univ, 
  index: Int
]: univ { 
  index.l 
} 

fun fun_list_contains[
  l: Int -> univ, 
  e: univ
]: boolean { 
  (e in Int.l) => true else false 
} 

fun fun_list_remove[
  l: Int -> univ, 
  index: Int
]: Int -> univ { 
  prevs[index]<:(l-(index->univ)) + next.(nexts[index]<:(l-(index->univ))) 
} 

fun fun_list_size[s: Int -> univ]: Int { #s } 

fun fun_list_equals[
  s1:Int -> univ, 
  s2: Int -> univ
]: boolean { 
  (s1=s2) => true else false 
} 

fun fun_list_empty[s: Int -> univ]: boolean { (#s = 0) => true else false }
pred pred_empty_map[map: univ -> univ] { (no map) }
fun fun_map_put[
  map: univ->univ, 
  k: univ, 
  v: univ
]: univ-> univ { 
  map ++ (k->v) 
}

fun fun_map_contains_key[
  map: univ -> univ, 
  k: univ
]: boolean { 
  (some k.map) => true else false 
}

fun fun_map_remove[
  map: univ -> univ, 
  k: univ
]: univ->univ {
  map - (k->univ) 
} 

fun fun_map_get[
  map: univ -> univ, 
  k: univ
]: univ { 
  (some k.map) => k.map else null 
} 

fun fun_map_is_empty[
  map: univ -> univ, 
]: boolean { 
  (some map) => false else true 
}

fun fun_map_clear[
  mapEntries1: univ -> univ -> univ, 
  map: univ
]: univ -> univ -> univ { 
  mapEntries1 - (map -> univ -> univ)
}

fun fun_map_size[
  map: univ -> univ, 
]: univ {
  #map 
}
pred isEmptyOrNull[u: univ] { u in null }
fun fun_closure[
  rel: univ -> univ 
]: univ -> univ {
  ^rel 
} 

fun fun_reflexive_closure[
  rel: univ -> univ 
]: univ -> univ {
  *rel 
} 

fun fun_transpose[
  rel: univ -> univ 
]: univ -> univ {
  ~rel 
}
pred liftExpression[
  expr: univ 
] {
  expr=true 
}
fun rel_override[
  r:univ->univ,
  k:univ, 
  v:univ
]: univ->univ { 
  r - (k->univ) + (k->v) 
} 

fun Not[a: boolean]: boolean {
    (a=true) => false else true 
}
fun Or[a: boolean, b: boolean]: boolean {
    (a=true or b=true) => true else false
}
fun And[a: boolean, b: boolean]: boolean {
    (a=true and b=true) => true else false
}
fun Xor[a: boolean, b: boolean]: boolean {
    ((a==true and b==false) or (a==false and b==true)) => true else false
}
fun AdderCarry[a: boolean, b: boolean, cin: boolean]: boolean {
    Or[ And[a,b], And[cin, Xor[a,b]]] 
}
fun AdderSum[a: boolean, b: boolean, cin: boolean]: boolean {
    Xor[Xor[a, b], cin]
}
pred updateFieldPost[
  f1:univ->univ,
  f0:univ->univ,
  l:univ,
  r:univ
]{ 
  (r=none) => f1=f0-(l->univ) else f1 = f0 ++ (l->r) 
}
pred havocVarPost[u:univ]{}
pred havocVariable2Post[u:univ->univ]{}
pred havocVariable3Post[u:univ->(seq univ)]{}
pred havocFieldPost[f0,f1: univ->univ, u:univ]{ 
  u<:f0 = u<:f1 
  some u.f1  
}
pred havocFieldContentsPost[target: univ, 
                            field_0: univ -> univ, 
                            field_1: univ -> univ] { 
  field_1 - (target->univ) = field_0 - (target->univ) 
}
pred havocListSeqPost[target: univ,
                            field_0: univ -> Int -> univ, 
                            field_1: univ -> Int -> univ] { 
  field_1 - (target->Int->univ) = field_0 - (target->Int->univ) 
}
pred pred_in[n: univ, t: set univ] { n in t }
pred instanceOf[n: univ, t: set univ] { n in t }
pred isCasteableTo[n: univ, t: set univ] { (n in t) or (n = null) }
pred getUnusedObjectPost[
  usedObjects1:set java_lang_Object, 
  usedObjects0:set java_lang_Object,
  n1: java_lang_Object+null
]{ 
  n1 !in usedObjects0 
  usedObjects1 = usedObjects0 + (n1)
}
//-------------- ClassFields--------------//
one
sig ClassFields {}
{}




//-------------- pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D--------------//
sig pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D extends java_lang_Object {}
{}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition16[
  var_7_node3:univ
]{
   not (
     isEmptyOrNull[var_7_node3])

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[
  var_7_node3:univ
]{
   isEmptyOrNull[var_7_node3]

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition19[
  var_3_remaining:univ,
  variant_0:univ
]{
   not (
     gte[var_3_remaining,
        variant_0]
   )

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[
  var_3_remaining:univ,
  variant_0:univ
]{
   gte[var_3_remaining,
      variant_0]

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition2[
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header:univ->univ,
  thiz:univ
]{
   isEmptyOrNull[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header]
   or 
   isEmptyOrNull[thiz]

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition3[
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header:univ->univ,
  thiz:univ
]{
   not (
     isEmptyOrNull[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header]
     or 
     isEmptyOrNull[thiz]
   )

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition1[
  exit_stmt_reached:univ,
  throw:univ
]{
   not (
     (
       throw=null)
     and 
     (
       exit_stmt_reached=false)
   )

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[
  pldi_nodecachinglinkedlist_LinkedListNode_next:univ->univ,
  var_1_node:univ
]{
   isEmptyOrNull[var_1_node.pldi_nodecachinglinkedlist_LinkedListNode_next]
   or 
   isEmptyOrNull[var_1_node]

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[
  exit_stmt_reached:univ,
  throw:univ
]{
   (
     throw=null)
   and 
   (
     exit_stmt_reached=false)

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[
  var_3_remaining:univ
]{
   lt[var_3_remaining,
     0]

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition12[
  t_2:univ
]{
   not (
     t_2=true)

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[
  t_2:univ
]{
   t_2=true

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition14[
  pldi_nodecachinglinkedlist_LinkedListNode_next:univ->univ,
  var_1_node:univ
]{
   not (
     isEmptyOrNull[var_1_node.pldi_nodecachinglinkedlist_LinkedListNode_next]
     or 
     isEmptyOrNull[var_1_node]
   )

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_object_invariant[
  pldi_nodecachinglinkedlist_LinkedListNode_next:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_previous:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size:univ->univ,
  thiz:univ
]{
   (
     all m:null+pldi_nodecachinglinkedlist_LinkedListNode | {
       liftExpression[fun_set_contains[fun_reach[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode,pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next],m]]
       implies 
               (
                 equ[fun_set_contains[fun_reach[m.pldi_nodecachinglinkedlist_LinkedListNode_next,pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next],m],
                    false]
                 and 
                 equ[m.pldi_nodecachinglinkedlist_LinkedListNode_previous,
                    null]
               )
     
     }
   )
   and 
   equ[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE,
      3]
   and 
   lte[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize,
      thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize]
   and 
   (
     neq[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode,
        null]
     implies 
             equ[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize,
                fun_set_size[fun_reach[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode,pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next]]]
   )
   and 
   neq[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,
      null]
   and 
   neq[(thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header).pldi_nodecachinglinkedlist_LinkedListNode_next,
      null]
   and 
   neq[(thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header).pldi_nodecachinglinkedlist_LinkedListNode_previous,
      null]
   and 
   (
     all n:null+pldi_nodecachinglinkedlist_LinkedListNode | {
       liftExpression[fun_set_contains[fun_reach[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next],n]]
       implies 
               (
                 neq[n.pldi_nodecachinglinkedlist_LinkedListNode_previous,
                    null]
                 and 
                 equ[(n.pldi_nodecachinglinkedlist_LinkedListNode_previous).pldi_nodecachinglinkedlist_LinkedListNode_next,
                    n]
                 and 
                 neq[n.pldi_nodecachinglinkedlist_LinkedListNode_next,
                    null]
                 and 
                 equ[(n.pldi_nodecachinglinkedlist_LinkedListNode_next).pldi_nodecachinglinkedlist_LinkedListNode_previous,
                    n]
               )
     
     }
   )
   and 
   equ[add[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size,1],
      fun_set_size[fun_reach[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next]]]
   and 
   gte[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size,
      0]

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[
  throw:univ
]{
   isEmptyOrNull[throw]

}
pred postcondition_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0[
  arg':univ,
  pldi_nodecachinglinkedlist_LinkedListNode_next:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_next':univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_previous:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_previous':univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_value:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_value':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size':univ->univ,
  return':univ,
  thiz:univ,
  thiz':univ,
  throw':univ
]{
   pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_ensures[arg',
                                                                            pldi_nodecachinglinkedlist_LinkedListNode_next,
                                                                            pldi_nodecachinglinkedlist_LinkedListNode_next',
                                                                            pldi_nodecachinglinkedlist_LinkedListNode_previous,
                                                                            pldi_nodecachinglinkedlist_LinkedListNode_previous',
                                                                            pldi_nodecachinglinkedlist_LinkedListNode_value,
                                                                            pldi_nodecachinglinkedlist_LinkedListNode_value',
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE,
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE',
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize,
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize',
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode,
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode',
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header',
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize,
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize',
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount,
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount',
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size,
                                                                            pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size',
                                                                            return',
                                                                            thiz,
                                                                            thiz',
                                                                            throw']
   and 
   (
     not (
       throw'=AssertionFailureLit)
   )

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition8[
  throw:univ
]{
   not (
     isEmptyOrNull[throw])

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[
  exit_stmt_reached:univ,
  throw:univ,
  var_8_ws_2:univ
]{
   liftExpression[var_8_ws_2]
   and 
   (
     throw=null)
   and 
   (
     exit_stmt_reached=false)

}
pred precondition_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0[
  arg:univ,
  pldi_nodecachinglinkedlist_LinkedListNode_next:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_previous:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_value:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size:univ->univ,
  return:univ,
  thiz:univ,
  throw:univ,
  usedObjects:univ
]{
   equ[throw,
      null]
   and 
   pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_object_invariant[pldi_nodecachinglinkedlist_LinkedListNode_next,
                                                                                     pldi_nodecachinglinkedlist_LinkedListNode_previous,
                                                                                     pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE,
                                                                                     pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize,
                                                                                     pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode,
                                                                                     pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,
                                                                                     pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize,
                                                                                     pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size,
                                                                                     thiz]
   and 
   pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_requires[arg,
                                                                             pldi_nodecachinglinkedlist_LinkedListNode_next,
                                                                             pldi_nodecachinglinkedlist_LinkedListNode_previous,
                                                                             pldi_nodecachinglinkedlist_LinkedListNode_value,
                                                                             pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE,
                                                                             pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize,
                                                                             pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode,
                                                                             pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,
                                                                             pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize,
                                                                             pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount,
                                                                             pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size,
                                                                             return,
                                                                             thiz,
                                                                             usedObjects]

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[
  exit_stmt_reached:univ,
  throw:univ,
  var_4_ws_1:univ
]{
   liftExpression[var_4_ws_1]
   and 
   (
     throw=null)
   and 
   (
     exit_stmt_reached=false)

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_requires[
  arg:univ,
  pldi_nodecachinglinkedlist_LinkedListNode_next:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_previous:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_value:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size:univ->univ,
  return:univ,
  thiz:univ,
  usedObjects:univ
]{
   (
     true=true)
   and 
   (
     usedObjects=fun_weak_reach[none+arg+thiz+return,java_lang_Object,(none)->(none)+pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header+pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode+pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize+pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize+pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size+pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE+pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount+pldi_nodecachinglinkedlist_LinkedListNode_previous+pldi_nodecachinglinkedlist_LinkedListNode_next+pldi_nodecachinglinkedlist_LinkedListNode_value])

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_ensures[
  arg':univ,
  pldi_nodecachinglinkedlist_LinkedListNode_next:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_next':univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_previous:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_previous':univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_value:univ->univ,
  pldi_nodecachinglinkedlist_LinkedListNode_value':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount':univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size:univ->univ,
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size':univ->univ,
  return':univ,
  thiz:univ,
  thiz':univ,
  throw':univ
]{
   (
     instanceOf[throw',
               java_lang_Exception]
     implies 
             liftExpression[false]
   )
   and 
   (
     (
       throw'=null)
     implies 
             equ[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount',
                thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount]
   )
   and 
   (
     (
       throw'=null)
     implies 
             equ[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE',
                thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE]
   )
   and 
   (
     (
       throw'=null)
     implies 
             equ[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size',
                thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size]
   )
   and 
   (
     (
       throw'=null)
     implies 
             equ[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize',
                thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize]
   )
   and 
   (
     (
       throw'=null)
     implies 
             equ[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize',
                thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize]
   )
   and 
   (
     (
       throw'=null)
     implies 
             equ[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode',
                thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode]
   )
   and 
   (
     (
       throw'=null)
     implies 
             equ[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header',
                thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header]
   )
   and 
   (
     (
       throw'=null)
     implies 
             (
               all n:null+pldi_nodecachinglinkedlist_LinkedListNode | {
                 liftExpression[fun_set_contains[fun_reach[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header',pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next'],n]]
                 implies 
                         liftExpression[fun_set_contains[fun_reach[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next],n]]
               
               }
             )
   )
   and 
   (
     (
       throw'=null)
     implies 
             (
               all n:null+pldi_nodecachinglinkedlist_LinkedListNode | {
                 liftExpression[fun_set_contains[fun_reach[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next],n]]
                 implies 
                         liftExpression[fun_set_contains[fun_reach[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header',pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next'],n]]
               
               }
             )
   )
   and 
   (
     (
       throw'=null)
     implies 
             (
               all n:null+pldi_nodecachinglinkedlist_LinkedListNode | {
                 liftExpression[fun_set_contains[fun_reach[thiz.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header,pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next],n]]
                 implies 
                         (
                           equ[n.pldi_nodecachinglinkedlist_LinkedListNode_next',
                              n.pldi_nodecachinglinkedlist_LinkedListNode_next]
                           and 
                           equ[n.pldi_nodecachinglinkedlist_LinkedListNode_previous',
                              n.pldi_nodecachinglinkedlist_LinkedListNode_previous]
                           and 
                           equ[n.pldi_nodecachinglinkedlist_LinkedListNode_value',
                              n.pldi_nodecachinglinkedlist_LinkedListNode_value]
                         )
               
               }
             )
   )
   and 
   (
     (
       throw'=null)
     implies 
             (
               (
                 equ[return',
                    true]
                 implies 
                         (
                           some n:null+pldi_nodecachinglinkedlist_LinkedListNode | {
                             (
                               fun_set_contains[fun_reach[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header',pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next'],n]=true)
                             and 
                             neq[n,
                                thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header']
                             and 
                             equ[n.pldi_nodecachinglinkedlist_LinkedListNode_value',
                                arg']
                           
                           }
                         )
               )
               and 
               (
                 (
                   some n:null+pldi_nodecachinglinkedlist_LinkedListNode | {
                     (
                       fun_set_contains[fun_reach[thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header',pldi_nodecachinglinkedlist_LinkedListNode,pldi_nodecachinglinkedlist_LinkedListNode_next'],n]=true)
                     and 
                     neq[n,
                        thiz'.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header']
                     and 
                     equ[n.pldi_nodecachinglinkedlist_LinkedListNode_value',
                        arg']
                   
                   }
                 )
                 implies 
                         equ[return',
                            true]
               )
             )
   )

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition10[
  var_3_remaining:univ
]{
   not (
     lt[var_3_remaining,
       0]
   )

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition5[
  var_2_node2:univ
]{
   not (
     isEmptyOrNull[var_2_node2])

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[
  var_2_node2:univ
]{
   isEmptyOrNull[var_2_node2]

}
pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[
  exit_stmt_reached:univ,
  throw:univ,
  var_5_ws_3:univ
]{
   liftExpression[var_5_ws_3]
   and 
   (
     throw=null)
   and 
   (
     exit_stmt_reached=false)

}
//-------------- java_lang_RuntimeException--------------//
abstract sig java_lang_RuntimeException extends java_lang_Exception {}
{}



one
sig java_lang_RuntimeExceptionLit extends java_lang_RuntimeException {}
{}

//-------------- java_lang_Exception--------------//
abstract sig java_lang_Exception extends java_lang_Throwable {}
{}



one
sig java_lang_ExceptionLit extends java_lang_Exception {}
{}

//-------------- java_lang_Throwable--------------//
abstract sig java_lang_Throwable extends java_lang_Object {}
{}



one
sig java_lang_ThrowableLit extends java_lang_Throwable {}
{}
//-------------- java_lang_Object--------------//
abstract sig java_lang_Object {}
{}




//-------------- java_lang_NullPointerException--------------//
abstract one sig java_lang_NullPointerException extends java_lang_RuntimeException {}
{}



one
sig java_lang_NullPointerExceptionLit extends java_lang_NullPointerException {}
{}

//-------------- pldi_nodecachinglinkedlist_LinkedListNode--------------//
sig pldi_nodecachinglinkedlist_LinkedListNode extends java_lang_Object {}
{}
check check_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0  for 0 but  exactly 1 pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D, 13 java_lang_Object, exactly 4 pldi_nodecachinglinkedlist_LinkedListNode,4 int



pred updateVariable[
  l_1: univ,
  r_0: univ
]{
  TruePred[]
  and 
  equ[l_1,
     r_0]
}


pred getUnusedObject[
  n_1: java_lang_Object + null,
  usedObjects_0: set java_lang_Object,
  usedObjects_1: set java_lang_Object
]{
  TruePred[]
  and 
  getUnusedObjectPost[usedObjects_1,
                     usedObjects_0,
                     n_1]
}


pred havocVariable[
  v_1: univ
]{
  TruePred[]
  and 
  havocVarPost[v_1]
}


pred havocFieldContents[
  target_0: univ,
  field_0: univ -> univ,
  field_1: univ -> univ
]{
  TruePred[]
  and 
  havocFieldContentsPost[target_0,
                        field_0,
                        field_1]
}


pred havocVariable3[
  u_1: univ -> ( seq univ )
]{
  TruePred[]
  and 
  havocVariable3Post[u_1]
}


pred havocVariable2[
  u_1: univ -> univ
]{
  TruePred[]
  and 
  havocVariable2Post[u_1]
}


pred havocField[
  f_0: univ -> univ,
  f_1: univ -> univ,
  u_0: univ
]{
  TruePred[]
  and 
  havocFieldPost[f_0,
                f_1,
                u_0]
}


pred havocListSeq[
  target_0: univ,
  field_0: univ -> Int -> univ,
  field_1: univ -> Int -> univ
]{
  TruePred[]
  and 
  havocListSeqPost[target_0,
                  field_0,
                  field_1]
}


pred updateField[
  l_0: univ,
  f_0: univ -> univ,
  f_1: univ -> univ,
  r_0: univ
]{
  TruePred[]
  and 
  updateFieldPost[f_1,
                 f_0,
                 l_0,
                 r_0]
}


pred pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0[
  thiz_0: pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D,
  throw_1: java_lang_Throwable + null,
  throw_2: java_lang_Throwable + null,
  throw_3: java_lang_Throwable + null,
  throw_4: java_lang_Throwable + null,
  throw_5: java_lang_Throwable + null,
  throw_6: java_lang_Throwable + null,
  throw_7: java_lang_Throwable + null,
  throw_8: java_lang_Throwable + null,
  throw_9: java_lang_Throwable + null,
  throw_10: java_lang_Throwable + null,
  throw_11: java_lang_Throwable + null,
  throw_12: java_lang_Throwable + null,
  throw_13: java_lang_Throwable + null,
  throw_14: java_lang_Throwable + null,
  throw_15: java_lang_Throwable + null,
  throw_16: java_lang_Throwable + null,
  throw_17: java_lang_Throwable + null,
  throw_18: java_lang_Throwable + null,
  throw_19: java_lang_Throwable + null,
  throw_20: java_lang_Throwable + null,
  throw_21: java_lang_Throwable + null,
  throw_22: java_lang_Throwable + null,
  throw_23: java_lang_Throwable + null,
  throw_24: java_lang_Throwable + null,
  throw_25: java_lang_Throwable + null,
  throw_26: java_lang_Throwable + null,
  throw_27: java_lang_Throwable + null,
  throw_28: java_lang_Throwable + null,
  throw_29: java_lang_Throwable + null,
  throw_30: java_lang_Throwable + null,
  throw_31: java_lang_Throwable + null,
  throw_32: java_lang_Throwable + null,
  throw_33: java_lang_Throwable + null,
  throw_34: java_lang_Throwable + null,
  throw_35: java_lang_Throwable + null,
  throw_36: java_lang_Throwable + null,
  throw_37: java_lang_Throwable + null,
  throw_38: java_lang_Throwable + null,
  throw_39: java_lang_Throwable + null,
  throw_40: java_lang_Throwable + null,
  throw_41: java_lang_Throwable + null,
  throw_42: java_lang_Throwable + null,
  return_0: boolean,
  return_1: boolean,
  return_2: boolean,
  return_3: boolean,
  return_4: boolean,
  return_5: boolean,
  arg_0: java_lang_Object + null,
  pldi_nodecachinglinkedlist_LinkedListNode_next_0: ( pldi_nodecachinglinkedlist_LinkedListNode ) -> one ( null + pldi_nodecachinglinkedlist_LinkedListNode ),
  pldi_nodecachinglinkedlist_LinkedListNode_value_0: ( pldi_nodecachinglinkedlist_LinkedListNode ) -> one ( java_lang_Object + null ),
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0: ( pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D ) -> one ( null + pldi_nodecachinglinkedlist_LinkedListNode ),
  usedObjects_0: set ( java_lang_Object ),
  usedObjects_1: set ( java_lang_Object ),
  usedObjects_2: set ( java_lang_Object ),
  usedObjects_3: set ( java_lang_Object ),
  usedObjects_4: set ( java_lang_Object ),
  usedObjects_5: set ( java_lang_Object ),
  usedObjects_6: set ( java_lang_Object ),
  usedObjects_7: set ( java_lang_Object ),
  usedObjects_8: set ( java_lang_Object ),
  t_2_0: boolean,
  t_2_1: boolean,
  t_2_2: boolean,
  t_2_3: boolean,
  t_2_4: boolean,
  var_3_remaining_0: Int,
  var_3_remaining_1: Int,
  var_3_remaining_2: Int,
  var_3_remaining_3: Int,
  var_3_remaining_4: Int,
  var_3_remaining_5: Int,
  var_3_remaining_6: Int,
  var_3_remaining_7: Int,
  var_3_remaining_8: Int,
  var_3_remaining_9: Int,
  exit_stmt_reached_1: boolean,
  exit_stmt_reached_2: boolean,
  exit_stmt_reached_3: boolean,
  exit_stmt_reached_4: boolean,
  exit_stmt_reached_5: boolean,
  exit_stmt_reached_6: boolean,
  var_8_ws_2_0: boolean,
  var_8_ws_2_1: boolean,
  var_8_ws_2_2: boolean,
  var_8_ws_2_3: boolean,
  var_8_ws_2_4: boolean,
  var_8_ws_2_5: boolean,
  var_8_ws_2_6: boolean,
  var_8_ws_2_7: boolean,
  var_8_ws_2_8: boolean,
  var_8_ws_2_9: boolean,
  var_8_ws_2_10: boolean,
  var_8_ws_2_11: boolean,
  var_8_ws_2_12: boolean,
  var_8_ws_2_13: boolean,
  var_8_ws_2_14: boolean,
  var_8_ws_2_15: boolean,
  var_8_ws_2_16: boolean,
  var_8_ws_2_17: boolean,
  var_8_ws_2_18: boolean,
  var_8_ws_2_19: boolean,
  var_8_ws_2_20: boolean,
  var_1_node_0: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_1_node_1: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_1_node_2: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_1_node_3: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_1_node_4: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_1_node_5: null + pldi_nodecachinglinkedlist_LinkedListNode,
  param_arg_0_0: java_lang_Object + null,
  param_arg_0_1: java_lang_Object + null,
  var_6_remaining2_0: Int,
  var_6_remaining2_1: Int,
  var_6_remaining2_2: Int,
  var_6_remaining2_3: Int,
  var_6_remaining2_4: Int,
  var_6_remaining2_5: Int,
  var_6_remaining2_6: Int,
  var_6_remaining2_7: Int,
  var_6_remaining2_8: Int,
  var_6_remaining2_9: Int,
  var_6_remaining2_10: Int,
  var_6_remaining2_11: Int,
  var_6_remaining2_12: Int,
  var_6_remaining2_13: Int,
  var_6_remaining2_14: Int,
  var_6_remaining2_15: Int,
  var_6_remaining2_16: Int,
  var_6_remaining2_17: Int,
  var_6_remaining2_18: Int,
  var_6_remaining2_19: Int,
  var_6_remaining2_20: Int,
  variant_0_0: Int,
  variant_0_1: Int,
  variant_0_2: Int,
  variant_0_3: Int,
  variant_0_4: Int,
  var_5_ws_3_0: boolean,
  var_5_ws_3_1: boolean,
  var_5_ws_3_2: boolean,
  var_5_ws_3_3: boolean,
  var_5_ws_3_4: boolean,
  var_5_ws_3_5: boolean,
  var_4_ws_1_0: boolean,
  var_4_ws_1_1: boolean,
  var_4_ws_1_2: boolean,
  var_4_ws_1_3: boolean,
  var_4_ws_1_4: boolean,
  var_4_ws_1_5: boolean,
  var_7_node3_0: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_1: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_2: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_3: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_4: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_5: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_6: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_7: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_8: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_9: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_10: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_11: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_12: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_13: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_14: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_15: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_16: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_17: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_18: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_19: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_7_node3_20: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_2_node2_0: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_2_node2_1: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_2_node2_2: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_2_node2_3: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_2_node2_4: null + pldi_nodecachinglinkedlist_LinkedListNode,
  var_2_node2_5: null + pldi_nodecachinglinkedlist_LinkedListNode
]{
  TruePred[]
  and 
  (
    throw_1=null)
  and 
  TruePred[]
  and 
  (
    exit_stmt_reached_1=false)
  and 
  TruePred[]
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                 throw_1]
      and 
      (
        param_arg_0_1=arg_0)
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        param_arg_0_0=param_arg_0_1)
    )
  )
  and 
  TruePred[]
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                 throw_1]
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition2[pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0,
                                                                                     thiz_0]
          and 
          (
            throw_2=java_lang_NullPointerExceptionLit)
          and 
          (
            var_1_node_0=var_1_node_1)
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition2[pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0,
                                                                                         thiz_0]
            )
          )
          and 
          (
            var_1_node_1=(thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0).pldi_nodecachinglinkedlist_LinkedListNode_next_0)
          and 
          (
            throw_1=throw_2)
        )
      )
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_1_node_0=var_1_node_1)
      and 
      (
        throw_1=throw_2)
    )
  )
  and 
  TruePred[]
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                 throw_2]
      and 
      (
        var_2_node2_1=var_1_node_1)
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_2]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_2_node2_0=var_2_node2_1)
    )
  )
  and 
  TruePred[]
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                 throw_2]
      and 
      (
        var_3_remaining_1=0)
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_2]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_3_remaining_0=var_3_remaining_1)
    )
  )
  and 
  TruePred[]
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                 throw_2]
      and 
      (
        var_4_ws_1_1=(neq[var_2_node2_1,
           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
      )
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_2]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_4_ws_1_0=var_4_ws_1_1)
    )
  )
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                 throw_2,
                                                                                 var_4_ws_1_1]
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_2]
          and 
          (
            var_3_remaining_2=add[var_3_remaining_1,1])
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_2]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_3_remaining_1=var_3_remaining_2)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_2]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[var_2_node2_1]
              and 
              (
                throw_3=java_lang_NullPointerExceptionLit)
              and 
              (
                var_2_node2_1=var_2_node2_2)
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[var_2_node2_1])
              )
              and 
              (
                var_2_node2_2=var_2_node2_1.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
              and 
              (
                throw_2=throw_3)
            )
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_2]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_2_node2_1=var_2_node2_2)
          and 
          (
            throw_2=throw_3)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_3]
          and 
          (
            var_4_ws_1_2=(neq[var_2_node2_2,
               thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_3]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_4_ws_1_1=var_4_ws_1_2)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                     throw_3,
                                                                                     var_4_ws_1_2]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_3]
              and 
              (
                var_3_remaining_3=add[var_3_remaining_2,1])
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                             throw_3]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_3_remaining_2=var_3_remaining_3)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_3]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[var_2_node2_2]
                  and 
                  (
                    throw_4=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    var_2_node2_2=var_2_node2_3)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[var_2_node2_2])
                  )
                  and 
                  (
                    var_2_node2_3=var_2_node2_2.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                  and 
                  (
                    throw_3=throw_4)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                             throw_3]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_2_node2_2=var_2_node2_3)
              and 
              (
                throw_3=throw_4)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_4]
              and 
              (
                var_4_ws_1_3=(neq[var_2_node2_3,
                   thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                             throw_4]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_4_ws_1_2=var_4_ws_1_3)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                         throw_4,
                                                                                         var_4_ws_1_3]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                             throw_4]
                  and 
                  (
                    var_3_remaining_4=add[var_3_remaining_3,1])
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                 throw_4]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_3_remaining_3=var_3_remaining_4)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                             throw_4]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[var_2_node2_3]
                      and 
                      (
                        throw_5=java_lang_NullPointerExceptionLit)
                      and 
                      (
                        var_2_node2_3=var_2_node2_4)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[var_2_node2_3])
                      )
                      and 
                      (
                        var_2_node2_4=var_2_node2_3.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                      and 
                      (
                        throw_4=throw_5)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                 throw_4]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_2_node2_3=var_2_node2_4)
                  and 
                  (
                    throw_4=throw_5)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                             throw_5]
                  and 
                  (
                    var_4_ws_1_4=(neq[var_2_node2_4,
                       thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                 throw_5]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_4_ws_1_3=var_4_ws_1_4)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                             throw_5,
                                                                                             var_4_ws_1_4]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                 throw_5]
                      and 
                      (
                        var_3_remaining_5=add[var_3_remaining_4,1])
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                     throw_5]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_3_remaining_4=var_3_remaining_5)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                 throw_5]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[var_2_node2_4]
                          and 
                          (
                            throw_6=java_lang_NullPointerExceptionLit)
                          and 
                          (
                            var_2_node2_4=var_2_node2_5)
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition4[var_2_node2_4])
                          )
                          and 
                          (
                            var_2_node2_5=var_2_node2_4.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                          and 
                          (
                            throw_5=throw_6)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                     throw_5]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_2_node2_4=var_2_node2_5)
                      and 
                      (
                        throw_5=throw_6)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                 throw_6]
                      and 
                      (
                        var_4_ws_1_5=(neq[var_2_node2_5,
                           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                     throw_6]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_4_ws_1_4=var_4_ws_1_5)
                    )
                  )
                  and 
                  TruePred[]
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                                 throw_5,
                                                                                                 var_4_ws_1_4]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_3_remaining_4=var_3_remaining_5)
                  and 
                  (
                    var_2_node2_4=var_2_node2_5)
                  and 
                  (
                    throw_5=throw_6)
                  and 
                  (
                    var_4_ws_1_4=var_4_ws_1_5)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                             throw_4,
                                                                                             var_4_ws_1_3]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_3_remaining_3=var_3_remaining_5)
              and 
              (
                var_2_node2_3=var_2_node2_5)
              and 
              (
                throw_4=throw_6)
              and 
              (
                var_4_ws_1_3=var_4_ws_1_5)
            )
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                         throw_3,
                                                                                         var_4_ws_1_2]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_3_remaining_2=var_3_remaining_5)
          and 
          (
            var_2_node2_2=var_2_node2_5)
          and 
          (
            throw_3=throw_6)
          and 
          (
            var_4_ws_1_2=var_4_ws_1_5)
        )
      )
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                     throw_2,
                                                                                     var_4_ws_1_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_3_remaining_1=var_3_remaining_5)
      and 
      (
        var_2_node2_1=var_2_node2_5)
      and 
      (
        throw_2=throw_6)
      and 
      (
        var_4_ws_1_1=var_4_ws_1_5)
    )
  )
  and 
  (
    not (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition6[exit_stmt_reached_1,
                                                                                 throw_6,
                                                                                 var_4_ws_1_5]
    )
  )
  and 
  TruePred[]
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                 throw_6]
      and 
      (
        var_5_ws_3_1=(equ[var_1_node_1,
           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
      )
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_6]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_5_ws_3_0=var_5_ws_3_1)
    )
  )
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_1,
                                                                                  throw_6,
                                                                                  var_5_ws_3_1]
      and 
      TruePred[]
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_6]
          and 
          (
            variant_0_1=var_3_remaining_5)
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_6]
            )
          )
          and 
          TruePred[]
          and 
          (
            variant_0_0=variant_0_1)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_6]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[var_3_remaining_5]
              and 
              getUnusedObject[throw_7,
                             usedObjects_0,
                             usedObjects_1]
              and 
              instanceOf[throw_7,
                        java_lang_Object]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_7]
                  and 
                  (
                    throw_8=java_lang_NullPointerExceptionLit)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_7])
                  )
                  and 
                  java_lang_Throwable_Constructor_0[]
                  and 
                  (
                    throw_7=throw_8)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[var_3_remaining_5])
              )
              and 
              TruePred[]
              and 
              (
                throw_6=throw_8)
              and 
              (
                usedObjects_0=usedObjects_1)
            )
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_6]
            )
          )
          and 
          TruePred[]
          and 
          (
            usedObjects_0=usedObjects_1)
          and 
          (
            throw_6=throw_8)
        )
      )
      and 
      TruePred[]
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_8]
          and 
          (
            t_2_1=(neq[var_1_node_1.pldi_nodecachinglinkedlist_LinkedListNode_value_0,
               arg_0]=>(true)else(false))
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_8]
            )
          )
          and 
          TruePred[]
          and 
          (
            t_2_0=t_2_1)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                     throw_8]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[t_2_1]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                             throw_8]
                  and 
                  (
                    return_1=true)
                  and 
                  (
                    exit_stmt_reached_2=true)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                                 throw_8]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    return_0=return_1)
                  and 
                  (
                    exit_stmt_reached_1=exit_stmt_reached_2)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[t_2_1])
              )
              and 
              TruePred[]
              and 
              (
                exit_stmt_reached_1=exit_stmt_reached_2)
              and 
              (
                return_0=return_1)
            )
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_1,
                                                                                         throw_8]
            )
          )
          and 
          TruePred[]
          and 
          (
            return_0=return_1)
          and 
          (
            exit_stmt_reached_1=exit_stmt_reached_2)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                     throw_8]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[pldi_nodecachinglinkedlist_LinkedListNode_next_0,
                                                                                          var_1_node_1]
              and 
              (
                throw_9=java_lang_NullPointerExceptionLit)
              and 
              (
                var_1_node_1=var_1_node_2)
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[pldi_nodecachinglinkedlist_LinkedListNode_next_0,
                                                                                              var_1_node_1]
                )
              )
              and 
              (
                var_1_node_2=(var_1_node_1.pldi_nodecachinglinkedlist_LinkedListNode_next_0).pldi_nodecachinglinkedlist_LinkedListNode_next_0)
              and 
              (
                throw_8=throw_9)
            )
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_8]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_1_node_1=var_1_node_2)
          and 
          (
            throw_8=throw_9)
        )
      )
      and 
      TruePred[]
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                     throw_9]
          and 
          (
            var_6_remaining2_1=0)
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_9]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_6_remaining2_0=var_6_remaining2_1)
        )
      )
      and 
      TruePred[]
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                     throw_9]
          and 
          (
            var_7_node3_1=var_1_node_2)
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_9]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_7_node3_0=var_7_node3_1)
        )
      )
      and 
      TruePred[]
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                     throw_9]
          and 
          (
            var_8_ws_2_1=(neq[var_7_node3_1,
               thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_9]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_8_ws_2_0=var_8_ws_2_1)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                      throw_9,
                                                                                      var_8_ws_2_1]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_9]
              and 
              (
                var_6_remaining2_2=add[var_6_remaining2_1,1])
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_9]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_6_remaining2_1=var_6_remaining2_2)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_9]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_1]
                  and 
                  (
                    throw_10=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    var_7_node3_1=var_7_node3_2)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_1])
                  )
                  and 
                  (
                    var_7_node3_2=var_7_node3_1.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                  and 
                  (
                    throw_9=throw_10)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_9]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_7_node3_1=var_7_node3_2)
              and 
              (
                throw_9=throw_10)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_10]
              and 
              (
                var_8_ws_2_2=(neq[var_7_node3_2,
                   thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_10]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_8_ws_2_1=var_8_ws_2_2)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                          throw_10,
                                                                                          var_8_ws_2_2]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_10]
                  and 
                  (
                    var_6_remaining2_3=add[var_6_remaining2_2,1])
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                 throw_10]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_6_remaining2_2=var_6_remaining2_3)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_10]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_2]
                      and 
                      (
                        throw_11=java_lang_NullPointerExceptionLit)
                      and 
                      (
                        var_7_node3_2=var_7_node3_3)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_2])
                      )
                      and 
                      (
                        var_7_node3_3=var_7_node3_2.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                      and 
                      (
                        throw_10=throw_11)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                 throw_10]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_7_node3_2=var_7_node3_3)
                  and 
                  (
                    throw_10=throw_11)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_11]
                  and 
                  (
                    var_8_ws_2_3=(neq[var_7_node3_3,
                       thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                 throw_11]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_8_ws_2_2=var_8_ws_2_3)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                              throw_11,
                                                                                              var_8_ws_2_3]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                 throw_11]
                      and 
                      (
                        var_6_remaining2_4=add[var_6_remaining2_3,1])
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                     throw_11]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_6_remaining2_3=var_6_remaining2_4)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                 throw_11]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_3]
                          and 
                          (
                            throw_12=java_lang_NullPointerExceptionLit)
                          and 
                          (
                            var_7_node3_3=var_7_node3_4)
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_3])
                          )
                          and 
                          (
                            var_7_node3_4=var_7_node3_3.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                          and 
                          (
                            throw_11=throw_12)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                     throw_11]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_7_node3_3=var_7_node3_4)
                      and 
                      (
                        throw_11=throw_12)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                 throw_12]
                      and 
                      (
                        var_8_ws_2_4=(neq[var_7_node3_4,
                           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                     throw_12]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_8_ws_2_3=var_8_ws_2_4)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                                  throw_12,
                                                                                                  var_8_ws_2_4]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                     throw_12]
                          and 
                          (
                            var_6_remaining2_5=add[var_6_remaining2_4,1])
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                         throw_12]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_6_remaining2_4=var_6_remaining2_5)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                     throw_12]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_4]
                              and 
                              (
                                throw_13=java_lang_NullPointerExceptionLit)
                              and 
                              (
                                var_7_node3_4=var_7_node3_5)
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_4])
                              )
                              and 
                              (
                                var_7_node3_5=var_7_node3_4.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                              and 
                              (
                                throw_12=throw_13)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                         throw_12]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_7_node3_4=var_7_node3_5)
                          and 
                          (
                            throw_12=throw_13)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                     throw_13]
                          and 
                          (
                            var_8_ws_2_5=(neq[var_7_node3_5,
                               thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                         throw_13]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_8_ws_2_4=var_8_ws_2_5)
                        )
                      )
                      and 
                      TruePred[]
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                                      throw_12,
                                                                                                      var_8_ws_2_4]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_6_remaining2_4=var_6_remaining2_5)
                      and 
                      (
                        var_7_node3_4=var_7_node3_5)
                      and 
                      (
                        throw_12=throw_13)
                      and 
                      (
                        var_8_ws_2_4=var_8_ws_2_5)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                                  throw_11,
                                                                                                  var_8_ws_2_3]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_6_remaining2_3=var_6_remaining2_5)
                  and 
                  (
                    var_7_node3_3=var_7_node3_5)
                  and 
                  (
                    throw_11=throw_13)
                  and 
                  (
                    var_8_ws_2_3=var_8_ws_2_5)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                              throw_10,
                                                                                              var_8_ws_2_2]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_6_remaining2_2=var_6_remaining2_5)
              and 
              (
                var_7_node3_2=var_7_node3_5)
              and 
              (
                throw_10=throw_13)
              and 
              (
                var_8_ws_2_2=var_8_ws_2_5)
            )
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                          throw_9,
                                                                                          var_8_ws_2_1]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_6_remaining2_1=var_6_remaining2_5)
          and 
          (
            var_7_node3_1=var_7_node3_5)
          and 
          (
            throw_9=throw_13)
          and 
          (
            var_8_ws_2_1=var_8_ws_2_5)
        )
      )
      and 
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_2,
                                                                                      throw_13,
                                                                                      var_8_ws_2_5]
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                     throw_13]
          and 
          (
            var_3_remaining_6=var_6_remaining2_5)
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_13]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_3_remaining_5=var_3_remaining_6)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                     throw_13]
          and 
          (
            var_5_ws_3_2=(equ[var_1_node_2,
               thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_13]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_5_ws_3_1=var_5_ws_3_2)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                     throw_13]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[var_3_remaining_6,
                                                                                          variant_0_1]
              and 
              getUnusedObject[throw_14,
                             usedObjects_1,
                             usedObjects_2]
              and 
              instanceOf[throw_14,
                        java_lang_Object]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_14]
                  and 
                  (
                    throw_15=java_lang_NullPointerExceptionLit)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_14])
                  )
                  and 
                  java_lang_Throwable_Constructor_0[]
                  and 
                  (
                    throw_14=throw_15)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[var_3_remaining_6,
                                                                                              variant_0_1]
                )
              )
              and 
              TruePred[]
              and 
              (
                throw_13=throw_15)
              and 
              (
                usedObjects_1=usedObjects_2)
            )
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_13]
            )
          )
          and 
          TruePred[]
          and 
          (
            usedObjects_1=usedObjects_2)
          and 
          (
            throw_13=throw_15)
        )
      )
      and 
      (
        (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_2,
                                                                                      throw_15,
                                                                                      var_5_ws_3_2]
          and 
          TruePred[]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_15]
              and 
              (
                variant_0_2=var_3_remaining_6)
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_15]
                )
              )
              and 
              TruePred[]
              and 
              (
                variant_0_1=variant_0_2)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_15]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[var_3_remaining_6]
                  and 
                  getUnusedObject[throw_16,
                                 usedObjects_2,
                                 usedObjects_3]
                  and 
                  instanceOf[throw_16,
                            java_lang_Object]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_16]
                      and 
                      (
                        throw_17=java_lang_NullPointerExceptionLit)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_16])
                      )
                      and 
                      java_lang_Throwable_Constructor_0[]
                      and 
                      (
                        throw_16=throw_17)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[var_3_remaining_6])
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    throw_15=throw_17)
                  and 
                  (
                    usedObjects_2=usedObjects_3)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_15]
                )
              )
              and 
              TruePred[]
              and 
              (
                usedObjects_2=usedObjects_3)
              and 
              (
                throw_15=throw_17)
            )
          )
          and 
          TruePred[]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_17]
              and 
              (
                t_2_2=(neq[var_1_node_2.pldi_nodecachinglinkedlist_LinkedListNode_value_0,
                   arg_0]=>(true)else(false))
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_17]
                )
              )
              and 
              TruePred[]
              and 
              (
                t_2_1=t_2_2)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                         throw_17]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[t_2_2]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                 throw_17]
                      and 
                      (
                        return_2=true)
                      and 
                      (
                        exit_stmt_reached_3=true)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                                     throw_17]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        return_1=return_2)
                      and 
                      (
                        exit_stmt_reached_2=exit_stmt_reached_3)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[t_2_2])
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    exit_stmt_reached_2=exit_stmt_reached_3)
                  and 
                  (
                    return_1=return_2)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_2,
                                                                                             throw_17]
                )
              )
              and 
              TruePred[]
              and 
              (
                return_1=return_2)
              and 
              (
                exit_stmt_reached_2=exit_stmt_reached_3)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                         throw_17]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[pldi_nodecachinglinkedlist_LinkedListNode_next_0,
                                                                                              var_1_node_2]
                  and 
                  (
                    throw_18=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    var_1_node_2=var_1_node_3)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[pldi_nodecachinglinkedlist_LinkedListNode_next_0,
                                                                                                  var_1_node_2]
                    )
                  )
                  and 
                  (
                    var_1_node_3=(var_1_node_2.pldi_nodecachinglinkedlist_LinkedListNode_next_0).pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                  and 
                  (
                    throw_17=throw_18)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_17]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_1_node_2=var_1_node_3)
              and 
              (
                throw_17=throw_18)
            )
          )
          and 
          TruePred[]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                         throw_18]
              and 
              (
                var_6_remaining2_6=0)
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_18]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_6_remaining2_5=var_6_remaining2_6)
            )
          )
          and 
          TruePred[]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                         throw_18]
              and 
              (
                var_7_node3_6=var_1_node_3)
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_18]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_7_node3_5=var_7_node3_6)
            )
          )
          and 
          TruePred[]
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                         throw_18]
              and 
              (
                var_8_ws_2_6=(neq[var_7_node3_6,
                   thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_18]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_8_ws_2_5=var_8_ws_2_6)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                          throw_18,
                                                                                          var_8_ws_2_6]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_18]
                  and 
                  (
                    var_6_remaining2_7=add[var_6_remaining2_6,1])
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_18]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_6_remaining2_6=var_6_remaining2_7)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_18]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_6]
                      and 
                      (
                        throw_19=java_lang_NullPointerExceptionLit)
                      and 
                      (
                        var_7_node3_6=var_7_node3_7)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_6])
                      )
                      and 
                      (
                        var_7_node3_7=var_7_node3_6.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                      and 
                      (
                        throw_18=throw_19)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_18]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_7_node3_6=var_7_node3_7)
                  and 
                  (
                    throw_18=throw_19)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_19]
                  and 
                  (
                    var_8_ws_2_7=(neq[var_7_node3_7,
                       thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_19]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_8_ws_2_6=var_8_ws_2_7)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                              throw_19,
                                                                                              var_8_ws_2_7]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_19]
                      and 
                      (
                        var_6_remaining2_8=add[var_6_remaining2_7,1])
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                     throw_19]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_6_remaining2_7=var_6_remaining2_8)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_19]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_7]
                          and 
                          (
                            throw_20=java_lang_NullPointerExceptionLit)
                          and 
                          (
                            var_7_node3_7=var_7_node3_8)
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_7])
                          )
                          and 
                          (
                            var_7_node3_8=var_7_node3_7.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                          and 
                          (
                            throw_19=throw_20)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                     throw_19]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_7_node3_7=var_7_node3_8)
                      and 
                      (
                        throw_19=throw_20)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_20]
                      and 
                      (
                        var_8_ws_2_8=(neq[var_7_node3_8,
                           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                     throw_20]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_8_ws_2_7=var_8_ws_2_8)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                                  throw_20,
                                                                                                  var_8_ws_2_8]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                     throw_20]
                          and 
                          (
                            var_6_remaining2_9=add[var_6_remaining2_8,1])
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                         throw_20]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_6_remaining2_8=var_6_remaining2_9)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                     throw_20]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_8]
                              and 
                              (
                                throw_21=java_lang_NullPointerExceptionLit)
                              and 
                              (
                                var_7_node3_8=var_7_node3_9)
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_8])
                              )
                              and 
                              (
                                var_7_node3_9=var_7_node3_8.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                              and 
                              (
                                throw_20=throw_21)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                         throw_20]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_7_node3_8=var_7_node3_9)
                          and 
                          (
                            throw_20=throw_21)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                     throw_21]
                          and 
                          (
                            var_8_ws_2_9=(neq[var_7_node3_9,
                               thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                         throw_21]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_8_ws_2_8=var_8_ws_2_9)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                                      throw_21,
                                                                                                      var_8_ws_2_9]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                         throw_21]
                              and 
                              (
                                var_6_remaining2_10=add[var_6_remaining2_9,1])
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                             throw_21]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_6_remaining2_9=var_6_remaining2_10)
                            )
                          )
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                         throw_21]
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_9]
                                  and 
                                  (
                                    throw_22=java_lang_NullPointerExceptionLit)
                                  and 
                                  (
                                    var_7_node3_9=var_7_node3_10)
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_9])
                                  )
                                  and 
                                  (
                                    var_7_node3_10=var_7_node3_9.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                                  and 
                                  (
                                    throw_21=throw_22)
                                )
                              )
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                             throw_21]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_7_node3_9=var_7_node3_10)
                              and 
                              (
                                throw_21=throw_22)
                            )
                          )
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                         throw_22]
                              and 
                              (
                                var_8_ws_2_10=(neq[var_7_node3_10,
                                   thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                              )
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                             throw_22]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_8_ws_2_9=var_8_ws_2_10)
                            )
                          )
                          and 
                          TruePred[]
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                                          throw_21,
                                                                                                          var_8_ws_2_9]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_6_remaining2_9=var_6_remaining2_10)
                          and 
                          (
                            var_7_node3_9=var_7_node3_10)
                          and 
                          (
                            throw_21=throw_22)
                          and 
                          (
                            var_8_ws_2_9=var_8_ws_2_10)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                                      throw_20,
                                                                                                      var_8_ws_2_8]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_6_remaining2_8=var_6_remaining2_10)
                      and 
                      (
                        var_7_node3_8=var_7_node3_10)
                      and 
                      (
                        throw_20=throw_22)
                      and 
                      (
                        var_8_ws_2_8=var_8_ws_2_10)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                                  throw_19,
                                                                                                  var_8_ws_2_7]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_6_remaining2_7=var_6_remaining2_10)
                  and 
                  (
                    var_7_node3_7=var_7_node3_10)
                  and 
                  (
                    throw_19=throw_22)
                  and 
                  (
                    var_8_ws_2_7=var_8_ws_2_10)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                              throw_18,
                                                                                              var_8_ws_2_6]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_6_remaining2_6=var_6_remaining2_10)
              and 
              (
                var_7_node3_6=var_7_node3_10)
              and 
              (
                throw_18=throw_22)
              and 
              (
                var_8_ws_2_6=var_8_ws_2_10)
            )
          )
          and 
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_3,
                                                                                          throw_22,
                                                                                          var_8_ws_2_10]
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                         throw_22]
              and 
              (
                var_3_remaining_7=var_6_remaining2_10)
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_22]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_3_remaining_6=var_3_remaining_7)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                         throw_22]
              and 
              (
                var_5_ws_3_3=(equ[var_1_node_3,
                   thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_22]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_5_ws_3_2=var_5_ws_3_3)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                         throw_22]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[var_3_remaining_7,
                                                                                              variant_0_2]
                  and 
                  getUnusedObject[throw_23,
                                 usedObjects_3,
                                 usedObjects_4]
                  and 
                  instanceOf[throw_23,
                            java_lang_Object]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_23]
                      and 
                      (
                        throw_24=java_lang_NullPointerExceptionLit)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_23])
                      )
                      and 
                      java_lang_Throwable_Constructor_0[]
                      and 
                      (
                        throw_23=throw_24)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[var_3_remaining_7,
                                                                                                  variant_0_2]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    throw_22=throw_24)
                  and 
                  (
                    usedObjects_3=usedObjects_4)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_22]
                )
              )
              and 
              TruePred[]
              and 
              (
                usedObjects_3=usedObjects_4)
              and 
              (
                throw_22=throw_24)
            )
          )
          and 
          (
            (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_3,
                                                                                          throw_24,
                                                                                          var_5_ws_3_3]
              and 
              TruePred[]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_24]
                  and 
                  (
                    variant_0_3=var_3_remaining_7)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_24]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    variant_0_2=variant_0_3)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_24]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[var_3_remaining_7]
                      and 
                      getUnusedObject[throw_25,
                                     usedObjects_4,
                                     usedObjects_5]
                      and 
                      instanceOf[throw_25,
                                java_lang_Object]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_25]
                          and 
                          (
                            throw_26=java_lang_NullPointerExceptionLit)
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_25])
                          )
                          and 
                          java_lang_Throwable_Constructor_0[]
                          and 
                          (
                            throw_25=throw_26)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[var_3_remaining_7])
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        throw_24=throw_26)
                      and 
                      (
                        usedObjects_4=usedObjects_5)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_24]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    usedObjects_4=usedObjects_5)
                  and 
                  (
                    throw_24=throw_26)
                )
              )
              and 
              TruePred[]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_26]
                  and 
                  (
                    t_2_3=(neq[var_1_node_3.pldi_nodecachinglinkedlist_LinkedListNode_value_0,
                       arg_0]=>(true)else(false))
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_26]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    t_2_2=t_2_3)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                             throw_26]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[t_2_3]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                     throw_26]
                          and 
                          (
                            return_3=true)
                          and 
                          (
                            exit_stmt_reached_4=true)
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                         throw_26]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            return_2=return_3)
                          and 
                          (
                            exit_stmt_reached_3=exit_stmt_reached_4)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[t_2_3])
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        exit_stmt_reached_3=exit_stmt_reached_4)
                      and 
                      (
                        return_2=return_3)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_3,
                                                                                                 throw_26]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    return_2=return_3)
                  and 
                  (
                    exit_stmt_reached_3=exit_stmt_reached_4)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                             throw_26]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[pldi_nodecachinglinkedlist_LinkedListNode_next_0,
                                                                                                  var_1_node_3]
                      and 
                      (
                        throw_27=java_lang_NullPointerExceptionLit)
                      and 
                      (
                        var_1_node_3=var_1_node_4)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[pldi_nodecachinglinkedlist_LinkedListNode_next_0,
                                                                                                      var_1_node_3]
                        )
                      )
                      and 
                      (
                        var_1_node_4=(var_1_node_3.pldi_nodecachinglinkedlist_LinkedListNode_next_0).pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                      and 
                      (
                        throw_26=throw_27)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_26]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_1_node_3=var_1_node_4)
                  and 
                  (
                    throw_26=throw_27)
                )
              )
              and 
              TruePred[]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                             throw_27]
                  and 
                  (
                    var_6_remaining2_11=0)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_27]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_6_remaining2_10=var_6_remaining2_11)
                )
              )
              and 
              TruePred[]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                             throw_27]
                  and 
                  (
                    var_7_node3_11=var_1_node_4)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_27]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_7_node3_10=var_7_node3_11)
                )
              )
              and 
              TruePred[]
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                             throw_27]
                  and 
                  (
                    var_8_ws_2_11=(neq[var_7_node3_11,
                       thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_27]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_8_ws_2_10=var_8_ws_2_11)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                              throw_27,
                                                                                              var_8_ws_2_11]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_27]
                      and 
                      (
                        var_6_remaining2_12=add[var_6_remaining2_11,1])
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_27]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_6_remaining2_11=var_6_remaining2_12)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_27]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_11]
                          and 
                          (
                            throw_28=java_lang_NullPointerExceptionLit)
                          and 
                          (
                            var_7_node3_11=var_7_node3_12)
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_11])
                          )
                          and 
                          (
                            var_7_node3_12=var_7_node3_11.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                          and 
                          (
                            throw_27=throw_28)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_27]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_7_node3_11=var_7_node3_12)
                      and 
                      (
                        throw_27=throw_28)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_28]
                      and 
                      (
                        var_8_ws_2_12=(neq[var_7_node3_12,
                           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_28]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_8_ws_2_11=var_8_ws_2_12)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                                  throw_28,
                                                                                                  var_8_ws_2_12]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_28]
                          and 
                          (
                            var_6_remaining2_13=add[var_6_remaining2_12,1])
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                         throw_28]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_6_remaining2_12=var_6_remaining2_13)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_28]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_12]
                              and 
                              (
                                throw_29=java_lang_NullPointerExceptionLit)
                              and 
                              (
                                var_7_node3_12=var_7_node3_13)
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_12])
                              )
                              and 
                              (
                                var_7_node3_13=var_7_node3_12.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                              and 
                              (
                                throw_28=throw_29)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                         throw_28]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_7_node3_12=var_7_node3_13)
                          and 
                          (
                            throw_28=throw_29)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_29]
                          and 
                          (
                            var_8_ws_2_13=(neq[var_7_node3_13,
                               thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                         throw_29]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_8_ws_2_12=var_8_ws_2_13)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                                      throw_29,
                                                                                                      var_8_ws_2_13]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                         throw_29]
                              and 
                              (
                                var_6_remaining2_14=add[var_6_remaining2_13,1])
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                             throw_29]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_6_remaining2_13=var_6_remaining2_14)
                            )
                          )
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                         throw_29]
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_13]
                                  and 
                                  (
                                    throw_30=java_lang_NullPointerExceptionLit)
                                  and 
                                  (
                                    var_7_node3_13=var_7_node3_14)
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_13])
                                  )
                                  and 
                                  (
                                    var_7_node3_14=var_7_node3_13.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                                  and 
                                  (
                                    throw_29=throw_30)
                                )
                              )
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                             throw_29]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_7_node3_13=var_7_node3_14)
                              and 
                              (
                                throw_29=throw_30)
                            )
                          )
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                         throw_30]
                              and 
                              (
                                var_8_ws_2_14=(neq[var_7_node3_14,
                                   thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                              )
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                             throw_30]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_8_ws_2_13=var_8_ws_2_14)
                            )
                          )
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                                          throw_30,
                                                                                                          var_8_ws_2_14]
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                             throw_30]
                                  and 
                                  (
                                    var_6_remaining2_15=add[var_6_remaining2_14,1])
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                                 throw_30]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_6_remaining2_14=var_6_remaining2_15)
                                )
                              )
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                             throw_30]
                                  and 
                                  (
                                    (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_14]
                                      and 
                                      (
                                        throw_31=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        var_7_node3_14=var_7_node3_15)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_14])
                                      )
                                      and 
                                      (
                                        var_7_node3_15=var_7_node3_14.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                                      and 
                                      (
                                        throw_30=throw_31)
                                    )
                                  )
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                                 throw_30]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_7_node3_14=var_7_node3_15)
                                  and 
                                  (
                                    throw_30=throw_31)
                                )
                              )
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                             throw_31]
                                  and 
                                  (
                                    var_8_ws_2_15=(neq[var_7_node3_15,
                                       thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                                  )
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                                 throw_31]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_8_ws_2_14=var_8_ws_2_15)
                                )
                              )
                              and 
                              TruePred[]
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                                              throw_30,
                                                                                                              var_8_ws_2_14]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_6_remaining2_14=var_6_remaining2_15)
                              and 
                              (
                                var_7_node3_14=var_7_node3_15)
                              and 
                              (
                                throw_30=throw_31)
                              and 
                              (
                                var_8_ws_2_14=var_8_ws_2_15)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                                          throw_29,
                                                                                                          var_8_ws_2_13]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_6_remaining2_13=var_6_remaining2_15)
                          and 
                          (
                            var_7_node3_13=var_7_node3_15)
                          and 
                          (
                            throw_29=throw_31)
                          and 
                          (
                            var_8_ws_2_13=var_8_ws_2_15)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                                      throw_28,
                                                                                                      var_8_ws_2_12]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_6_remaining2_12=var_6_remaining2_15)
                      and 
                      (
                        var_7_node3_12=var_7_node3_15)
                      and 
                      (
                        throw_28=throw_31)
                      and 
                      (
                        var_8_ws_2_12=var_8_ws_2_15)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                                  throw_27,
                                                                                                  var_8_ws_2_11]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_6_remaining2_11=var_6_remaining2_15)
                  and 
                  (
                    var_7_node3_11=var_7_node3_15)
                  and 
                  (
                    throw_27=throw_31)
                  and 
                  (
                    var_8_ws_2_11=var_8_ws_2_15)
                )
              )
              and 
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_4,
                                                                                              throw_31,
                                                                                              var_8_ws_2_15]
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                             throw_31]
                  and 
                  (
                    var_3_remaining_8=var_6_remaining2_15)
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_31]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_3_remaining_7=var_3_remaining_8)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                             throw_31]
                  and 
                  (
                    var_5_ws_3_4=(equ[var_1_node_4,
                       thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_31]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_5_ws_3_3=var_5_ws_3_4)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                             throw_31]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[var_3_remaining_8,
                                                                                                  variant_0_3]
                      and 
                      getUnusedObject[throw_32,
                                     usedObjects_5,
                                     usedObjects_6]
                      and 
                      instanceOf[throw_32,
                                java_lang_Object]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_32]
                          and 
                          (
                            throw_33=java_lang_NullPointerExceptionLit)
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_32])
                          )
                          and 
                          java_lang_Throwable_Constructor_0[]
                          and 
                          (
                            throw_32=throw_33)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[var_3_remaining_8,
                                                                                                      variant_0_3]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        throw_31=throw_33)
                      and 
                      (
                        usedObjects_5=usedObjects_6)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_31]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    usedObjects_5=usedObjects_6)
                  and 
                  (
                    throw_31=throw_33)
                )
              )
              and 
              (
                (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_4,
                                                                                              throw_33,
                                                                                              var_5_ws_3_4]
                  and 
                  TruePred[]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_33]
                      and 
                      (
                        variant_0_4=var_3_remaining_8)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_33]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        variant_0_3=variant_0_4)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_33]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[var_3_remaining_8]
                          and 
                          getUnusedObject[throw_34,
                                         usedObjects_6,
                                         usedObjects_7]
                          and 
                          instanceOf[throw_34,
                                    java_lang_Object]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_34]
                              and 
                              (
                                throw_35=java_lang_NullPointerExceptionLit)
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_34])
                              )
                              and 
                              java_lang_Throwable_Constructor_0[]
                              and 
                              (
                                throw_34=throw_35)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition9[var_3_remaining_8])
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            throw_33=throw_35)
                          and 
                          (
                            usedObjects_6=usedObjects_7)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_33]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        usedObjects_6=usedObjects_7)
                      and 
                      (
                        throw_33=throw_35)
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_35]
                      and 
                      (
                        t_2_4=(neq[var_1_node_4.pldi_nodecachinglinkedlist_LinkedListNode_value_0,
                           arg_0]=>(true)else(false))
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_35]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        t_2_3=t_2_4)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                 throw_35]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[t_2_4]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                         throw_35]
                              and 
                              (
                                return_4=true)
                              and 
                              (
                                exit_stmt_reached_5=true)
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                             throw_35]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                return_3=return_4)
                              and 
                              (
                                exit_stmt_reached_4=exit_stmt_reached_5)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition11[t_2_4])
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            exit_stmt_reached_4=exit_stmt_reached_5)
                          and 
                          (
                            return_3=return_4)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_4,
                                                                                                     throw_35]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        return_3=return_4)
                      and 
                      (
                        exit_stmt_reached_4=exit_stmt_reached_5)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                 throw_35]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[pldi_nodecachinglinkedlist_LinkedListNode_next_0,
                                                                                                      var_1_node_4]
                          and 
                          (
                            throw_36=java_lang_NullPointerExceptionLit)
                          and 
                          (
                            var_1_node_4=var_1_node_5)
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition13[pldi_nodecachinglinkedlist_LinkedListNode_next_0,
                                                                                                          var_1_node_4]
                            )
                          )
                          and 
                          (
                            var_1_node_5=(var_1_node_4.pldi_nodecachinglinkedlist_LinkedListNode_next_0).pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                          and 
                          (
                            throw_35=throw_36)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_35]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_1_node_4=var_1_node_5)
                      and 
                      (
                        throw_35=throw_36)
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                 throw_36]
                      and 
                      (
                        var_6_remaining2_16=0)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_36]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_6_remaining2_15=var_6_remaining2_16)
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                 throw_36]
                      and 
                      (
                        var_7_node3_16=var_1_node_5)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_36]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_7_node3_15=var_7_node3_16)
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                 throw_36]
                      and 
                      (
                        var_8_ws_2_16=(neq[var_7_node3_16,
                           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_36]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_8_ws_2_15=var_8_ws_2_16)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                  throw_36,
                                                                                                  var_8_ws_2_16]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_36]
                          and 
                          (
                            var_6_remaining2_17=add[var_6_remaining2_16,1])
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                         throw_36]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_6_remaining2_16=var_6_remaining2_17)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_36]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_16]
                              and 
                              (
                                throw_37=java_lang_NullPointerExceptionLit)
                              and 
                              (
                                var_7_node3_16=var_7_node3_17)
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_16])
                              )
                              and 
                              (
                                var_7_node3_17=var_7_node3_16.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                              and 
                              (
                                throw_36=throw_37)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                         throw_36]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_7_node3_16=var_7_node3_17)
                          and 
                          (
                            throw_36=throw_37)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_37]
                          and 
                          (
                            var_8_ws_2_17=(neq[var_7_node3_17,
                               thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                         throw_37]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_8_ws_2_16=var_8_ws_2_17)
                        )
                      )
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                      throw_37,
                                                                                                      var_8_ws_2_17]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                         throw_37]
                              and 
                              (
                                var_6_remaining2_18=add[var_6_remaining2_17,1])
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                             throw_37]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_6_remaining2_17=var_6_remaining2_18)
                            )
                          )
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                         throw_37]
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_17]
                                  and 
                                  (
                                    throw_38=java_lang_NullPointerExceptionLit)
                                  and 
                                  (
                                    var_7_node3_17=var_7_node3_18)
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_17])
                                  )
                                  and 
                                  (
                                    var_7_node3_18=var_7_node3_17.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                                  and 
                                  (
                                    throw_37=throw_38)
                                )
                              )
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                             throw_37]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_7_node3_17=var_7_node3_18)
                              and 
                              (
                                throw_37=throw_38)
                            )
                          )
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                         throw_38]
                              and 
                              (
                                var_8_ws_2_18=(neq[var_7_node3_18,
                                   thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                              )
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                             throw_38]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_8_ws_2_17=var_8_ws_2_18)
                            )
                          )
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                          throw_38,
                                                                                                          var_8_ws_2_18]
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                             throw_38]
                                  and 
                                  (
                                    var_6_remaining2_19=add[var_6_remaining2_18,1])
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                 throw_38]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_6_remaining2_18=var_6_remaining2_19)
                                )
                              )
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                             throw_38]
                                  and 
                                  (
                                    (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_18]
                                      and 
                                      (
                                        throw_39=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        var_7_node3_18=var_7_node3_19)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_18])
                                      )
                                      and 
                                      (
                                        var_7_node3_19=var_7_node3_18.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                                      and 
                                      (
                                        throw_38=throw_39)
                                    )
                                  )
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                 throw_38]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_7_node3_18=var_7_node3_19)
                                  and 
                                  (
                                    throw_38=throw_39)
                                )
                              )
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                             throw_39]
                                  and 
                                  (
                                    var_8_ws_2_19=(neq[var_7_node3_19,
                                       thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                                  )
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                 throw_39]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_8_ws_2_18=var_8_ws_2_19)
                                )
                              )
                              and 
                              (
                                (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                              throw_39,
                                                                                                              var_8_ws_2_19]
                                  and 
                                  (
                                    (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                 throw_39]
                                      and 
                                      (
                                        var_6_remaining2_20=add[var_6_remaining2_19,1])
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                     throw_39]
                                        )
                                      )
                                      and 
                                      TruePred[]
                                      and 
                                      (
                                        var_6_remaining2_19=var_6_remaining2_20)
                                    )
                                  )
                                  and 
                                  (
                                    (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                 throw_39]
                                      and 
                                      (
                                        (
                                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_19]
                                          and 
                                          (
                                            throw_40=java_lang_NullPointerExceptionLit)
                                          and 
                                          (
                                            var_7_node3_19=var_7_node3_20)
                                        )
                                        or 
                                        (
                                          (
                                            not (
                                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition15[var_7_node3_19])
                                          )
                                          and 
                                          (
                                            var_7_node3_20=var_7_node3_19.pldi_nodecachinglinkedlist_LinkedListNode_next_0)
                                          and 
                                          (
                                            throw_39=throw_40)
                                        )
                                      )
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                     throw_39]
                                        )
                                      )
                                      and 
                                      TruePred[]
                                      and 
                                      (
                                        var_7_node3_19=var_7_node3_20)
                                      and 
                                      (
                                        throw_39=throw_40)
                                    )
                                  )
                                  and 
                                  (
                                    (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                 throw_40]
                                      and 
                                      (
                                        var_8_ws_2_20=(neq[var_7_node3_20,
                                           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                                      )
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                                     throw_40]
                                        )
                                      )
                                      and 
                                      TruePred[]
                                      and 
                                      (
                                        var_8_ws_2_19=var_8_ws_2_20)
                                    )
                                  )
                                  and 
                                  TruePred[]
                                )
                                or 
                                (
                                  (
                                    not (
                                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                                  throw_39,
                                                                                                                  var_8_ws_2_19]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_6_remaining2_19=var_6_remaining2_20)
                                  and 
                                  (
                                    var_7_node3_19=var_7_node3_20)
                                  and 
                                  (
                                    throw_39=throw_40)
                                  and 
                                  (
                                    var_8_ws_2_19=var_8_ws_2_20)
                                )
                              )
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                              throw_38,
                                                                                                              var_8_ws_2_18]
                                )
                              )
                              and 
                              TruePred[]
                              and 
                              (
                                var_6_remaining2_18=var_6_remaining2_20)
                              and 
                              (
                                var_7_node3_18=var_7_node3_20)
                              and 
                              (
                                throw_38=throw_40)
                              and 
                              (
                                var_8_ws_2_18=var_8_ws_2_20)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                          throw_37,
                                                                                                          var_8_ws_2_17]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            var_6_remaining2_17=var_6_remaining2_20)
                          and 
                          (
                            var_7_node3_17=var_7_node3_20)
                          and 
                          (
                            throw_37=throw_40)
                          and 
                          (
                            var_8_ws_2_17=var_8_ws_2_20)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                      throw_36,
                                                                                                      var_8_ws_2_16]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_6_remaining2_16=var_6_remaining2_20)
                      and 
                      (
                        var_7_node3_16=var_7_node3_20)
                      and 
                      (
                        throw_36=throw_40)
                      and 
                      (
                        var_8_ws_2_16=var_8_ws_2_20)
                    )
                  )
                  and 
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition17[exit_stmt_reached_5,
                                                                                                  throw_40,
                                                                                                  var_8_ws_2_20]
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                 throw_40]
                      and 
                      (
                        var_3_remaining_9=var_6_remaining2_20)
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_40]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_3_remaining_8=var_3_remaining_9)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                 throw_40]
                      and 
                      (
                        var_5_ws_3_5=(equ[var_1_node_5,
                           thiz_0.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0]=>(true)else(false))
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_40]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        var_5_ws_3_4=var_5_ws_3_5)
                    )
                  )
                  and 
                  (
                    (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                 throw_40]
                      and 
                      (
                        (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[var_3_remaining_9,
                                                                                                      variant_0_4]
                          and 
                          getUnusedObject[throw_41,
                                         usedObjects_7,
                                         usedObjects_8]
                          and 
                          instanceOf[throw_41,
                                    java_lang_Object]
                          and 
                          (
                            (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_41]
                              and 
                              (
                                throw_42=java_lang_NullPointerExceptionLit)
                            )
                            or 
                            (
                              (
                                not (
                                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition7[throw_41])
                              )
                              and 
                              java_lang_Throwable_Constructor_0[]
                              and 
                              (
                                throw_41=throw_42)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition18[var_3_remaining_9,
                                                                                                          variant_0_4]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            throw_40=throw_42)
                          and 
                          (
                            usedObjects_7=usedObjects_8)
                        )
                      )
                    )
                    or 
                    (
                      (
                        not (
                          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                                     throw_40]
                        )
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        usedObjects_7=usedObjects_8)
                      and 
                      (
                        throw_40=throw_42)
                    )
                  )
                  and 
                  TruePred[]
                )
                or 
                (
                  (
                    not (
                      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_4,
                                                                                                  throw_33,
                                                                                                  var_5_ws_3_4]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_8_ws_2_15=var_8_ws_2_20)
                  and 
                  (
                    return_3=return_4)
                  and 
                  (
                    var_7_node3_15=var_7_node3_20)
                  and 
                  (
                    t_2_3=t_2_4)
                  and 
                  (
                    var_3_remaining_8=var_3_remaining_9)
                  and 
                  (
                    var_6_remaining2_15=var_6_remaining2_20)
                  and 
                  (
                    variant_0_3=variant_0_4)
                  and 
                  (
                    var_1_node_4=var_1_node_5)
                  and 
                  (
                    usedObjects_6=usedObjects_8)
                  and 
                  (
                    throw_33=throw_42)
                  and 
                  (
                    exit_stmt_reached_4=exit_stmt_reached_5)
                  and 
                  (
                    var_5_ws_3_4=var_5_ws_3_5)
                )
              )
            )
            or 
            (
              (
                not (
                  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_3,
                                                                                              throw_24,
                                                                                              var_5_ws_3_3]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_8_ws_2_10=var_8_ws_2_20)
              and 
              (
                return_2=return_4)
              and 
              (
                var_7_node3_10=var_7_node3_20)
              and 
              (
                t_2_2=t_2_4)
              and 
              (
                var_3_remaining_7=var_3_remaining_9)
              and 
              (
                var_6_remaining2_10=var_6_remaining2_20)
              and 
              (
                variant_0_2=variant_0_4)
              and 
              (
                var_1_node_3=var_1_node_5)
              and 
              (
                usedObjects_4=usedObjects_8)
              and 
              (
                throw_24=throw_42)
              and 
              (
                exit_stmt_reached_3=exit_stmt_reached_5)
              and 
              (
                var_5_ws_3_3=var_5_ws_3_5)
            )
          )
        )
        or 
        (
          (
            not (
              pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_2,
                                                                                          throw_15,
                                                                                          var_5_ws_3_2]
            )
          )
          and 
          TruePred[]
          and 
          (
            var_8_ws_2_5=var_8_ws_2_20)
          and 
          (
            return_1=return_4)
          and 
          (
            var_7_node3_5=var_7_node3_20)
          and 
          (
            t_2_1=t_2_4)
          and 
          (
            var_3_remaining_6=var_3_remaining_9)
          and 
          (
            var_6_remaining2_5=var_6_remaining2_20)
          and 
          (
            variant_0_1=variant_0_4)
          and 
          (
            var_1_node_2=var_1_node_5)
          and 
          (
            usedObjects_2=usedObjects_8)
          and 
          (
            throw_15=throw_42)
          and 
          (
            exit_stmt_reached_2=exit_stmt_reached_5)
          and 
          (
            var_5_ws_3_2=var_5_ws_3_5)
        )
      )
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_1,
                                                                                      throw_6,
                                                                                      var_5_ws_3_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_8_ws_2_0=var_8_ws_2_20)
      and 
      (
        return_0=return_4)
      and 
      (
        var_7_node3_0=var_7_node3_20)
      and 
      (
        t_2_0=t_2_4)
      and 
      (
        var_3_remaining_5=var_3_remaining_9)
      and 
      (
        var_6_remaining2_0=var_6_remaining2_20)
      and 
      (
        variant_0_0=variant_0_4)
      and 
      (
        var_1_node_1=var_1_node_5)
      and 
      (
        usedObjects_0=usedObjects_8)
      and 
      (
        throw_6=throw_42)
      and 
      (
        exit_stmt_reached_1=exit_stmt_reached_5)
      and 
      (
        var_5_ws_3_1=var_5_ws_3_5)
    )
  )
  and 
  (
    not (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition20[exit_stmt_reached_5,
                                                                                  throw_42,
                                                                                  var_5_ws_3_5]
    )
  )
  and 
  (
    (
      pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                 throw_42]
      and 
      (
        return_5=false)
      and 
      (
        exit_stmt_reached_6=true)
    )
    or 
    (
      (
        not (
          pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6DCondition0[exit_stmt_reached_5,
                                                                                     throw_42]
        )
      )
      and 
      TruePred[]
      and 
      (
        return_4=return_5)
      and 
      (
        exit_stmt_reached_5=exit_stmt_reached_6)
    )
  )
  and 
  TruePred[]

}



pred java_lang_Throwable_Constructor_0[
]{
  TruePred[]
}

//-------------SMB sigs-------------// 
one sig pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_0 extends pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D {} 

one sig pldi_nodecachinglinkedlist_LinkedListNode_0, pldi_nodecachinglinkedlist_LinkedListNode_1, pldi_nodecachinglinkedlist_LinkedListNode_2, pldi_nodecachinglinkedlist_LinkedListNode_3 extends pldi_nodecachinglinkedlist_LinkedListNode {} 

one sig java_lang_Object_0, java_lang_Object_1, java_lang_Object_2, java_lang_Object_3, java_lang_Object_4, java_lang_Object_5, java_lang_Object_6, java_lang_Object_7 extends java_lang_Object {} 

fact {
  no ( QF.fpldi_nodecachinglinkedlist_LinkedListNode_previous_0.univ & QF.bpldi_nodecachinglinkedlist_LinkedListNode_previous_0.univ ) and 
  pldi_nodecachinglinkedlist_LinkedListNode = QF.fpldi_nodecachinglinkedlist_LinkedListNode_previous_0.univ + QF.bpldi_nodecachinglinkedlist_LinkedListNode_previous_0.univ 
}
fact {
  no ( QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0.univ & QF.bpldi_nodecachinglinkedlist_LinkedListNode_next_0.univ ) and 
  pldi_nodecachinglinkedlist_LinkedListNode = QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0.univ + QF.bpldi_nodecachinglinkedlist_LinkedListNode_next_0.univ 
}
//-----SMB: local_ordering()-----//
fun next_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D [] : pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D -> lone pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D { 
none -> none 
}
fun min_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D [os: set pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D] : lone pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D {
  os - os.^(next_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D[]) 
}
fun prevs_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D[o : pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D] : set pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D {
  o.^(~next_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D[]) 
}
fun next_pldi_nodecachinglinkedlist_LinkedListNode [] : pldi_nodecachinglinkedlist_LinkedListNode -> lone pldi_nodecachinglinkedlist_LinkedListNode { 
  pldi_nodecachinglinkedlist_LinkedListNode_0 -> pldi_nodecachinglinkedlist_LinkedListNode_1 +
  pldi_nodecachinglinkedlist_LinkedListNode_1 -> pldi_nodecachinglinkedlist_LinkedListNode_2 +
  pldi_nodecachinglinkedlist_LinkedListNode_2 -> pldi_nodecachinglinkedlist_LinkedListNode_3 
}
fun min_pldi_nodecachinglinkedlist_LinkedListNode [os: set pldi_nodecachinglinkedlist_LinkedListNode] : lone pldi_nodecachinglinkedlist_LinkedListNode {
  os - os.^(next_pldi_nodecachinglinkedlist_LinkedListNode[]) 
}
fun prevs_pldi_nodecachinglinkedlist_LinkedListNode[o : pldi_nodecachinglinkedlist_LinkedListNode] : set pldi_nodecachinglinkedlist_LinkedListNode {
  o.^(~next_pldi_nodecachinglinkedlist_LinkedListNode[]) 
}
fun next_java_lang_Object [] : java_lang_Object -> lone java_lang_Object { 
  java_lang_Object_0 -> java_lang_Object_1 +
  java_lang_Object_1 -> java_lang_Object_2 +
  java_lang_Object_2 -> java_lang_Object_3 +
  java_lang_Object_3 -> java_lang_Object_4 +
  java_lang_Object_4 -> java_lang_Object_5 +
  java_lang_Object_5 -> java_lang_Object_6 +
  java_lang_Object_6 -> java_lang_Object_7 
}
fun min_java_lang_Object [os: set java_lang_Object] : lone java_lang_Object {
  os - os.^(next_java_lang_Object[]) 
}
fun prevs_java_lang_Object[o : java_lang_Object] : set java_lang_Object {
  o.^(~next_java_lang_Object[]) 
}
//-----SMB: global_ordering()-----//
fun globalNext[]: java_lang_Object -> lone java_lang_Object {
pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_0 -> pldi_nodecachinglinkedlist_LinkedListNode_0  +  pldi_nodecachinglinkedlist_LinkedListNode_0 -> pldi_nodecachinglinkedlist_LinkedListNode_1  +  pldi_nodecachinglinkedlist_LinkedListNode_1 -> pldi_nodecachinglinkedlist_LinkedListNode_2  +  pldi_nodecachinglinkedlist_LinkedListNode_2 -> pldi_nodecachinglinkedlist_LinkedListNode_3  +  pldi_nodecachinglinkedlist_LinkedListNode_3 -> java_lang_Object_0  +  java_lang_Object_0 -> java_lang_Object_1  +  java_lang_Object_1 -> java_lang_Object_2  +  java_lang_Object_2 -> java_lang_Object_3  +  java_lang_Object_3 -> java_lang_Object_4  +  java_lang_Object_4 -> java_lang_Object_5  +  java_lang_Object_5 -> java_lang_Object_6  +  java_lang_Object_6 -> java_lang_Object_7
}
fun globalMin[s : set java_lang_Object] : lone java_lang_Object {
s - s.^globalNext[] 
}
//-----SMB: define_min_parent()-----//
fun minP_pldi_nodecachinglinkedlist_LinkedListNode [o : pldi_nodecachinglinkedlist_LinkedListNode] : java_lang_Object {
  globalMin[(QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0 + QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode_0 + QF.fpldi_nodecachinglinkedlist_LinkedListNode_previous_0 + QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0).o]
}
fun minP_java_lang_Object [o : java_lang_Object] : java_lang_Object {
  globalMin[(QF.pldi_nodecachinglinkedlist_LinkedListNode_value_0).o]
}
//-----SMB: define_freach()-----//
fun FReach[] : set java_lang_Object {
(QF.thiz_0 + QF.arg_0).*(QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0 + QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode_0 + QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize_0 + QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize_0 + QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size_0 + QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE_0 + QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount_0 + QF.pldi_nodecachinglinkedlist_LinkedListNode_value_0 + QF.fpldi_nodecachinglinkedlist_LinkedListNode_previous_0 + QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0) - null
}
//-----SMB: order_root_nodes()-----//
//-----SMB: root_is_minimum()-----//
fact {
((QF.thiz_0 != null) implies QF.thiz_0 = pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_0 )
}
//-----SMB: order_same_min_parent()-----//
fact {
 all disj o1, o2: pldi_nodecachinglinkedlist_LinkedListNode |
  let p1=minP_pldi_nodecachinglinkedlist_LinkedListNode[o1]|
  let p2=minP_pldi_nodecachinglinkedlist_LinkedListNode[o2]|
  (o1+o2 in FReach[] and
  some p1 and some p2 and
  p1=p2 and p1 in pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D) implies 
(((p1.(QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0)=o1 and p1.(QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode_0)=o2) implies
  o2 = o1.next_pldi_nodecachinglinkedlist_LinkedListNode[])
)
}
fact {
 all disj o1, o2: pldi_nodecachinglinkedlist_LinkedListNode |
  let p1=minP_pldi_nodecachinglinkedlist_LinkedListNode[o1]|
  let p2=minP_pldi_nodecachinglinkedlist_LinkedListNode[o2]|
  (o1+o2 in FReach[] and
  some p1 and some p2 and
  p1=p2 and p1 in pldi_nodecachinglinkedlist_LinkedListNode) implies 
(((p1.((QF.fpldi_nodecachinglinkedlist_LinkedListNode_previous_0))=o1 and p1.((QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0))=o2) implies
  o2 = o1.next_pldi_nodecachinglinkedlist_LinkedListNode[])
)
}
//-----SMB: order_same_min_parent_type()-----//
fact {
 all disj o1, o2:pldi_nodecachinglinkedlist_LinkedListNode |
  let p1=minP_pldi_nodecachinglinkedlist_LinkedListNode[o1]|
  let p2=minP_pldi_nodecachinglinkedlist_LinkedListNode[o2]|
  (o1 + o2 in FReach[] and
  some p1 and some p2 and
  p1!=p2 and p1+p2 in pldi_nodecachinglinkedlist_LinkedListNode and p1 in prevs_pldi_nodecachinglinkedlist_LinkedListNode[p2] )
  implies o1 in prevs_pldi_nodecachinglinkedlist_LinkedListNode[o2]
}
fact {
 all disj o1, o2:pldi_nodecachinglinkedlist_LinkedListNode |
  let p1=minP_pldi_nodecachinglinkedlist_LinkedListNode[o1]|
  let p2=minP_pldi_nodecachinglinkedlist_LinkedListNode[o2]|
  (o1 + o2 in FReach[] and
  some p1 and some p2 and
  p1!=p2 and p1+p2 in java_lang_Object and p1 in prevs_java_lang_Object[p2] )
  implies o1 in prevs_pldi_nodecachinglinkedlist_LinkedListNode[o2]
}
//-----SMB: order_diff_min_parent_type()-----//
fact {
 all disj o1, o2:pldi_nodecachinglinkedlist_LinkedListNode |
  let p1=minP_pldi_nodecachinglinkedlist_LinkedListNode[o1]|
  let p2=minP_pldi_nodecachinglinkedlist_LinkedListNode[o2]|
  ( o1+o2 in FReach[] and
 some p1 and some p2 and
p1 in pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D and p2 in pldi_nodecachinglinkedlist_LinkedListNode )
implies o1 in prevs_pldi_nodecachinglinkedlist_LinkedListNode[o2]
}
//-----SMB: avoid_holes()-----//
fact {
 all o : pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D | 
  o in FReach[] implies
   prevs_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D[o] in FReach[]
}
fact {
 all o : pldi_nodecachinglinkedlist_LinkedListNode | 
  o in FReach[] implies
   prevs_pldi_nodecachinglinkedlist_LinkedListNode[o] in FReach[]
}
fact {
 all o : java_lang_Object | 
  o in FReach[] implies
   prevs_java_lang_Object[o] in FReach[]
}
/*
type ordering:
==============
1) pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D
2) pldi_nodecachinglinkedlist_LinkedListNode
3) java_lang_Object

root nodes ordering:
====================
1) thiz:pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D
2) arg:java_lang_Object+null

recursive field ordering:
=========================
1) pldi_nodecachinglinkedlist_LinkedListNode_previous:(pldi_nodecachinglinkedlist_LinkedListNode)->one(null+pldi_nodecachinglinkedlist_LinkedListNode)
2) pldi_nodecachinglinkedlist_LinkedListNode_next:(pldi_nodecachinglinkedlist_LinkedListNode)->one(null+pldi_nodecachinglinkedlist_LinkedListNode)

non-recursive field ordering:
=============================
1) pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header:(pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D)->one(null+pldi_nodecachinglinkedlist_LinkedListNode)
2) pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode:(pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D)->one(null+pldi_nodecachinglinkedlist_LinkedListNode)
3) pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize:(pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D)->one(Int)
4) pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize:(pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D)->one(Int)
5) pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size:(pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D)->one(Int)
6) pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE:(pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D)->one(Int)
7) pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount:(pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D)->one(Int)
8) pldi_nodecachinglinkedlist_LinkedListNode_value:(pldi_nodecachinglinkedlist_LinkedListNode)->one(java_lang_Object+null)
*/
one sig QF {
  arg_0: java_lang_Object + null,
  bpldi_nodecachinglinkedlist_LinkedListNode_next_0:(pldi_nodecachinglinkedlist_LinkedListNode) -> lone((pldi_nodecachinglinkedlist_LinkedListNode)),
  bpldi_nodecachinglinkedlist_LinkedListNode_previous_0:(pldi_nodecachinglinkedlist_LinkedListNode) -> lone((pldi_nodecachinglinkedlist_LinkedListNode)),
  fpldi_nodecachinglinkedlist_LinkedListNode_next_0:(pldi_nodecachinglinkedlist_LinkedListNode) -> lone((null + pldi_nodecachinglinkedlist_LinkedListNode)),
  fpldi_nodecachinglinkedlist_LinkedListNode_previous_0:(pldi_nodecachinglinkedlist_LinkedListNode) -> lone((null + pldi_nodecachinglinkedlist_LinkedListNode)),
  l8_exit_stmt_reached_1: boolean,
  l8_exit_stmt_reached_2: boolean,
  l8_exit_stmt_reached_3: boolean,
  l8_exit_stmt_reached_4: boolean,
  l8_exit_stmt_reached_5: boolean,
  l8_exit_stmt_reached_6: boolean,
  l8_param_arg_0_0: java_lang_Object + null,
  l8_param_arg_0_1: java_lang_Object + null,
  l8_t_2_0: boolean,
  l8_t_2_1: boolean,
  l8_t_2_2: boolean,
  l8_t_2_3: boolean,
  l8_t_2_4: boolean,
  l8_var_1_node_0: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_1_node_1: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_1_node_2: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_1_node_3: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_1_node_4: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_1_node_5: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_2_node2_0: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_2_node2_1: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_2_node2_2: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_2_node2_3: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_2_node2_4: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_2_node2_5: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_3_remaining_0: Int,
  l8_var_3_remaining_1: Int,
  l8_var_3_remaining_2: Int,
  l8_var_3_remaining_3: Int,
  l8_var_3_remaining_4: Int,
  l8_var_3_remaining_5: Int,
  l8_var_3_remaining_6: Int,
  l8_var_3_remaining_7: Int,
  l8_var_3_remaining_8: Int,
  l8_var_3_remaining_9: Int,
  l8_var_4_ws_1_0: boolean,
  l8_var_4_ws_1_1: boolean,
  l8_var_4_ws_1_2: boolean,
  l8_var_4_ws_1_3: boolean,
  l8_var_4_ws_1_4: boolean,
  l8_var_4_ws_1_5: boolean,
  l8_var_5_ws_3_0: boolean,
  l8_var_5_ws_3_1: boolean,
  l8_var_5_ws_3_2: boolean,
  l8_var_5_ws_3_3: boolean,
  l8_var_5_ws_3_4: boolean,
  l8_var_5_ws_3_5: boolean,
  l8_var_6_remaining2_0: Int,
  l8_var_6_remaining2_1: Int,
  l8_var_6_remaining2_10: Int,
  l8_var_6_remaining2_11: Int,
  l8_var_6_remaining2_12: Int,
  l8_var_6_remaining2_13: Int,
  l8_var_6_remaining2_14: Int,
  l8_var_6_remaining2_15: Int,
  l8_var_6_remaining2_16: Int,
  l8_var_6_remaining2_17: Int,
  l8_var_6_remaining2_18: Int,
  l8_var_6_remaining2_19: Int,
  l8_var_6_remaining2_2: Int,
  l8_var_6_remaining2_20: Int,
  l8_var_6_remaining2_3: Int,
  l8_var_6_remaining2_4: Int,
  l8_var_6_remaining2_5: Int,
  l8_var_6_remaining2_6: Int,
  l8_var_6_remaining2_7: Int,
  l8_var_6_remaining2_8: Int,
  l8_var_6_remaining2_9: Int,
  l8_var_7_node3_0: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_1: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_10: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_11: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_12: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_13: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_14: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_15: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_16: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_17: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_18: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_19: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_2: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_20: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_3: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_4: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_5: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_6: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_7: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_8: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_7_node3_9: null + pldi_nodecachinglinkedlist_LinkedListNode,
  l8_var_8_ws_2_0: boolean,
  l8_var_8_ws_2_1: boolean,
  l8_var_8_ws_2_10: boolean,
  l8_var_8_ws_2_11: boolean,
  l8_var_8_ws_2_12: boolean,
  l8_var_8_ws_2_13: boolean,
  l8_var_8_ws_2_14: boolean,
  l8_var_8_ws_2_15: boolean,
  l8_var_8_ws_2_16: boolean,
  l8_var_8_ws_2_17: boolean,
  l8_var_8_ws_2_18: boolean,
  l8_var_8_ws_2_19: boolean,
  l8_var_8_ws_2_2: boolean,
  l8_var_8_ws_2_20: boolean,
  l8_var_8_ws_2_3: boolean,
  l8_var_8_ws_2_4: boolean,
  l8_var_8_ws_2_5: boolean,
  l8_var_8_ws_2_6: boolean,
  l8_var_8_ws_2_7: boolean,
  l8_var_8_ws_2_8: boolean,
  l8_var_8_ws_2_9: boolean,
  l8_variant_0_0: Int,
  l8_variant_0_1: Int,
  l8_variant_0_2: Int,
  l8_variant_0_3: Int,
  l8_variant_0_4: Int,
  pldi_nodecachinglinkedlist_LinkedListNode_value_0: ( pldi_nodecachinglinkedlist_LinkedListNode ) -> one ( java_lang_Object + null ),
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE_0: ( pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D ) -> one ( Int ),
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize_0: ( pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D ) -> one ( Int ),
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode_0: ( pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D ) -> one ( null + pldi_nodecachinglinkedlist_LinkedListNode ),
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0: ( pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D ) -> one ( null + pldi_nodecachinglinkedlist_LinkedListNode ),
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize_0: ( pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D ) -> one ( Int ),
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount_0: ( pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D ) -> one ( Int ),
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size_0: ( pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D ) -> one ( Int ),
  return_0: boolean,
  return_1: boolean,
  return_2: boolean,
  return_3: boolean,
  return_4: boolean,
  return_5: boolean,
  thiz_0: pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D,
  throw_0: java_lang_Throwable + null,
  throw_1: java_lang_Throwable + null,
  throw_10: java_lang_Throwable + null,
  throw_11: java_lang_Throwable + null,
  throw_12: java_lang_Throwable + null,
  throw_13: java_lang_Throwable + null,
  throw_14: java_lang_Throwable + null,
  throw_15: java_lang_Throwable + null,
  throw_16: java_lang_Throwable + null,
  throw_17: java_lang_Throwable + null,
  throw_18: java_lang_Throwable + null,
  throw_19: java_lang_Throwable + null,
  throw_2: java_lang_Throwable + null,
  throw_20: java_lang_Throwable + null,
  throw_21: java_lang_Throwable + null,
  throw_22: java_lang_Throwable + null,
  throw_23: java_lang_Throwable + null,
  throw_24: java_lang_Throwable + null,
  throw_25: java_lang_Throwable + null,
  throw_26: java_lang_Throwable + null,
  throw_27: java_lang_Throwable + null,
  throw_28: java_lang_Throwable + null,
  throw_29: java_lang_Throwable + null,
  throw_3: java_lang_Throwable + null,
  throw_30: java_lang_Throwable + null,
  throw_31: java_lang_Throwable + null,
  throw_32: java_lang_Throwable + null,
  throw_33: java_lang_Throwable + null,
  throw_34: java_lang_Throwable + null,
  throw_35: java_lang_Throwable + null,
  throw_36: java_lang_Throwable + null,
  throw_37: java_lang_Throwable + null,
  throw_38: java_lang_Throwable + null,
  throw_39: java_lang_Throwable + null,
  throw_4: java_lang_Throwable + null,
  throw_40: java_lang_Throwable + null,
  throw_41: java_lang_Throwable + null,
  throw_42: java_lang_Throwable + null,
  throw_5: java_lang_Throwable + null,
  throw_6: java_lang_Throwable + null,
  throw_7: java_lang_Throwable + null,
  throw_8: java_lang_Throwable + null,
  throw_9: java_lang_Throwable + null,
  usedObjects_0: set ( java_lang_Object ),
  usedObjects_1: set ( java_lang_Object ),
  usedObjects_2: set ( java_lang_Object ),
  usedObjects_3: set ( java_lang_Object ),
  usedObjects_4: set ( java_lang_Object ),
  usedObjects_5: set ( java_lang_Object ),
  usedObjects_6: set ( java_lang_Object ),
  usedObjects_7: set ( java_lang_Object ),
  usedObjects_8: set ( java_lang_Object )
}


fact {
  precondition_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0[QF.arg_0,
                                                                                           (QF.bpldi_nodecachinglinkedlist_LinkedListNode_next_0)+(QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0),
                                                                                           (QF.bpldi_nodecachinglinkedlist_LinkedListNode_previous_0)+(QF.fpldi_nodecachinglinkedlist_LinkedListNode_previous_0),
                                                                                           QF.pldi_nodecachinglinkedlist_LinkedListNode_value_0,
                                                                                           QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE_0,
                                                                                           QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize_0,
                                                                                           QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode_0,
                                                                                           QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0,
                                                                                           QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize_0,
                                                                                           QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount_0,
                                                                                           QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size_0,
                                                                                           QF.return_0,
                                                                                           QF.thiz_0,
                                                                                           QF.throw_0,
                                                                                           QF.usedObjects_0]

}

fact {
  pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0[QF.thiz_0,
                                                                              QF.throw_1,
                                                                              QF.throw_2,
                                                                              QF.throw_3,
                                                                              QF.throw_4,
                                                                              QF.throw_5,
                                                                              QF.throw_6,
                                                                              QF.throw_7,
                                                                              QF.throw_8,
                                                                              QF.throw_9,
                                                                              QF.throw_10,
                                                                              QF.throw_11,
                                                                              QF.throw_12,
                                                                              QF.throw_13,
                                                                              QF.throw_14,
                                                                              QF.throw_15,
                                                                              QF.throw_16,
                                                                              QF.throw_17,
                                                                              QF.throw_18,
                                                                              QF.throw_19,
                                                                              QF.throw_20,
                                                                              QF.throw_21,
                                                                              QF.throw_22,
                                                                              QF.throw_23,
                                                                              QF.throw_24,
                                                                              QF.throw_25,
                                                                              QF.throw_26,
                                                                              QF.throw_27,
                                                                              QF.throw_28,
                                                                              QF.throw_29,
                                                                              QF.throw_30,
                                                                              QF.throw_31,
                                                                              QF.throw_32,
                                                                              QF.throw_33,
                                                                              QF.throw_34,
                                                                              QF.throw_35,
                                                                              QF.throw_36,
                                                                              QF.throw_37,
                                                                              QF.throw_38,
                                                                              QF.throw_39,
                                                                              QF.throw_40,
                                                                              QF.throw_41,
                                                                              QF.throw_42,
                                                                              QF.return_0,
                                                                              QF.return_1,
                                                                              QF.return_2,
                                                                              QF.return_3,
                                                                              QF.return_4,
                                                                              QF.return_5,
                                                                              QF.arg_0,
                                                                              (QF.bpldi_nodecachinglinkedlist_LinkedListNode_next_0)+(QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0),
                                                                              QF.pldi_nodecachinglinkedlist_LinkedListNode_value_0,
                                                                              QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0,
                                                                              QF.usedObjects_0,
                                                                              QF.usedObjects_1,
                                                                              QF.usedObjects_2,
                                                                              QF.usedObjects_3,
                                                                              QF.usedObjects_4,
                                                                              QF.usedObjects_5,
                                                                              QF.usedObjects_6,
                                                                              QF.usedObjects_7,
                                                                              QF.usedObjects_8,
                                                                              QF.l8_t_2_0,
                                                                              QF.l8_t_2_1,
                                                                              QF.l8_t_2_2,
                                                                              QF.l8_t_2_3,
                                                                              QF.l8_t_2_4,
                                                                              QF.l8_var_3_remaining_0,
                                                                              QF.l8_var_3_remaining_1,
                                                                              QF.l8_var_3_remaining_2,
                                                                              QF.l8_var_3_remaining_3,
                                                                              QF.l8_var_3_remaining_4,
                                                                              QF.l8_var_3_remaining_5,
                                                                              QF.l8_var_3_remaining_6,
                                                                              QF.l8_var_3_remaining_7,
                                                                              QF.l8_var_3_remaining_8,
                                                                              QF.l8_var_3_remaining_9,
                                                                              QF.l8_exit_stmt_reached_1,
                                                                              QF.l8_exit_stmt_reached_2,
                                                                              QF.l8_exit_stmt_reached_3,
                                                                              QF.l8_exit_stmt_reached_4,
                                                                              QF.l8_exit_stmt_reached_5,
                                                                              QF.l8_exit_stmt_reached_6,
                                                                              QF.l8_var_8_ws_2_0,
                                                                              QF.l8_var_8_ws_2_1,
                                                                              QF.l8_var_8_ws_2_2,
                                                                              QF.l8_var_8_ws_2_3,
                                                                              QF.l8_var_8_ws_2_4,
                                                                              QF.l8_var_8_ws_2_5,
                                                                              QF.l8_var_8_ws_2_6,
                                                                              QF.l8_var_8_ws_2_7,
                                                                              QF.l8_var_8_ws_2_8,
                                                                              QF.l8_var_8_ws_2_9,
                                                                              QF.l8_var_8_ws_2_10,
                                                                              QF.l8_var_8_ws_2_11,
                                                                              QF.l8_var_8_ws_2_12,
                                                                              QF.l8_var_8_ws_2_13,
                                                                              QF.l8_var_8_ws_2_14,
                                                                              QF.l8_var_8_ws_2_15,
                                                                              QF.l8_var_8_ws_2_16,
                                                                              QF.l8_var_8_ws_2_17,
                                                                              QF.l8_var_8_ws_2_18,
                                                                              QF.l8_var_8_ws_2_19,
                                                                              QF.l8_var_8_ws_2_20,
                                                                              QF.l8_var_1_node_0,
                                                                              QF.l8_var_1_node_1,
                                                                              QF.l8_var_1_node_2,
                                                                              QF.l8_var_1_node_3,
                                                                              QF.l8_var_1_node_4,
                                                                              QF.l8_var_1_node_5,
                                                                              QF.l8_param_arg_0_0,
                                                                              QF.l8_param_arg_0_1,
                                                                              QF.l8_var_6_remaining2_0,
                                                                              QF.l8_var_6_remaining2_1,
                                                                              QF.l8_var_6_remaining2_2,
                                                                              QF.l8_var_6_remaining2_3,
                                                                              QF.l8_var_6_remaining2_4,
                                                                              QF.l8_var_6_remaining2_5,
                                                                              QF.l8_var_6_remaining2_6,
                                                                              QF.l8_var_6_remaining2_7,
                                                                              QF.l8_var_6_remaining2_8,
                                                                              QF.l8_var_6_remaining2_9,
                                                                              QF.l8_var_6_remaining2_10,
                                                                              QF.l8_var_6_remaining2_11,
                                                                              QF.l8_var_6_remaining2_12,
                                                                              QF.l8_var_6_remaining2_13,
                                                                              QF.l8_var_6_remaining2_14,
                                                                              QF.l8_var_6_remaining2_15,
                                                                              QF.l8_var_6_remaining2_16,
                                                                              QF.l8_var_6_remaining2_17,
                                                                              QF.l8_var_6_remaining2_18,
                                                                              QF.l8_var_6_remaining2_19,
                                                                              QF.l8_var_6_remaining2_20,
                                                                              QF.l8_variant_0_0,
                                                                              QF.l8_variant_0_1,
                                                                              QF.l8_variant_0_2,
                                                                              QF.l8_variant_0_3,
                                                                              QF.l8_variant_0_4,
                                                                              QF.l8_var_5_ws_3_0,
                                                                              QF.l8_var_5_ws_3_1,
                                                                              QF.l8_var_5_ws_3_2,
                                                                              QF.l8_var_5_ws_3_3,
                                                                              QF.l8_var_5_ws_3_4,
                                                                              QF.l8_var_5_ws_3_5,
                                                                              QF.l8_var_4_ws_1_0,
                                                                              QF.l8_var_4_ws_1_1,
                                                                              QF.l8_var_4_ws_1_2,
                                                                              QF.l8_var_4_ws_1_3,
                                                                              QF.l8_var_4_ws_1_4,
                                                                              QF.l8_var_4_ws_1_5,
                                                                              QF.l8_var_7_node3_0,
                                                                              QF.l8_var_7_node3_1,
                                                                              QF.l8_var_7_node3_2,
                                                                              QF.l8_var_7_node3_3,
                                                                              QF.l8_var_7_node3_4,
                                                                              QF.l8_var_7_node3_5,
                                                                              QF.l8_var_7_node3_6,
                                                                              QF.l8_var_7_node3_7,
                                                                              QF.l8_var_7_node3_8,
                                                                              QF.l8_var_7_node3_9,
                                                                              QF.l8_var_7_node3_10,
                                                                              QF.l8_var_7_node3_11,
                                                                              QF.l8_var_7_node3_12,
                                                                              QF.l8_var_7_node3_13,
                                                                              QF.l8_var_7_node3_14,
                                                                              QF.l8_var_7_node3_15,
                                                                              QF.l8_var_7_node3_16,
                                                                              QF.l8_var_7_node3_17,
                                                                              QF.l8_var_7_node3_18,
                                                                              QF.l8_var_7_node3_19,
                                                                              QF.l8_var_7_node3_20,
                                                                              QF.l8_var_2_node2_0,
                                                                              QF.l8_var_2_node2_1,
                                                                              QF.l8_var_2_node2_2,
                                                                              QF.l8_var_2_node2_3,
                                                                              QF.l8_var_2_node2_4,
                                                                              QF.l8_var_2_node2_5]

}

assert check_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0{
  postcondition_pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_contains_0[QF.arg_0,
                                                                                            (QF.bpldi_nodecachinglinkedlist_LinkedListNode_next_0)+(QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0),
                                                                                            (QF.bpldi_nodecachinglinkedlist_LinkedListNode_next_0)+(QF.fpldi_nodecachinglinkedlist_LinkedListNode_next_0),
                                                                                            (QF.bpldi_nodecachinglinkedlist_LinkedListNode_previous_0)+(QF.fpldi_nodecachinglinkedlist_LinkedListNode_previous_0),
                                                                                            (QF.bpldi_nodecachinglinkedlist_LinkedListNode_previous_0)+(QF.fpldi_nodecachinglinkedlist_LinkedListNode_previous_0),
                                                                                            QF.pldi_nodecachinglinkedlist_LinkedListNode_value_0,
                                                                                            QF.pldi_nodecachinglinkedlist_LinkedListNode_value_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_DEFAULT_MAXIMUM_CACHE_SIZE_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_cacheSize_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_firstCachedNode_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_header_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_maximumCacheSize_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_modCount_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size_0,
                                                                                            QF.pldi_nodecachinglinkedlist_NodeCachingLinkedListContainsBug3x2x6D_size_0,
                                                                                            QF.return_5,
                                                                                            QF.thiz_0,
                                                                                            QF.thiz_0,
                                                                                            QF.throw_42]
}
