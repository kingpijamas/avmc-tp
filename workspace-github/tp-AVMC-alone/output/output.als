/* 
 * DynAlloy translator options 
 * --------------------------- 
 * assertionId= check_ar_edu_itba_ayvmc_BinTreeBug_add_0
 * loopUnroll= 1
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
//-------------- ar_edu_itba_ayvmc_BinTreeBug--------------//
sig ar_edu_itba_ayvmc_BinTreeBug extends java_lang_Object {}
{}
pred ar_edu_itba_ayvmc_BinTreeBug_object_invariant[
  ar_edu_itba_ayvmc_BinTreeBug_root:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_left:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_right:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_value:univ->univ,
  n:univ,
  thiz:univ
]{
   (
     all n:ar_edu_itba_ayvmc_NodeBTBug+null | {
       liftExpression[fun_set_contains[fun_reach[thiz.ar_edu_itba_ayvmc_BinTreeBug_root,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],n]]
       implies 
               equ[fun_set_contains[fun_reach[n.ar_edu_itba_ayvmc_NodeBTBug_left,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],n],
                  false]
     
     }
   )
   and 
   (
     all n:ar_edu_itba_ayvmc_NodeBTBug+null | {
       liftExpression[fun_set_contains[fun_reach[thiz.ar_edu_itba_ayvmc_BinTreeBug_root,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],n]]
       implies 
               (
                 all m:ar_edu_itba_ayvmc_NodeBTBug+null | {
                   liftExpression[fun_set_contains[fun_reach[n.ar_edu_itba_ayvmc_NodeBTBug_left,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],m]]
                   implies 
                           lt[m.ar_edu_itba_ayvmc_NodeBTBug_value,
                             n.ar_edu_itba_ayvmc_NodeBTBug_value]
                 
                 }
               )
     
     }
   )
   and 
   (
     all n:ar_edu_itba_ayvmc_NodeBTBug+null | {
       liftExpression[fun_set_contains[fun_reach[thiz.ar_edu_itba_ayvmc_BinTreeBug_root,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],n]]
       implies 
               equ[fun_set_contains[fun_reach[n.ar_edu_itba_ayvmc_NodeBTBug_right,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],n],
                  false]
     
     }
   )
   and 
   (
     all n:ar_edu_itba_ayvmc_NodeBTBug+null | {
       liftExpression[fun_set_contains[fun_reach[thiz.ar_edu_itba_ayvmc_BinTreeBug_root,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],n]]
       implies 
               (
                 all m:ar_edu_itba_ayvmc_NodeBTBug+null | {
                   liftExpression[fun_set_contains[fun_reach[n.ar_edu_itba_ayvmc_NodeBTBug_right,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],m]]
                   implies 
                           gte[m.ar_edu_itba_ayvmc_NodeBTBug_value,
                              n.ar_edu_itba_ayvmc_NodeBTBug_value]
                 
                 }
               )
     
     }
   )

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition15[
  ar_edu_itba_ayvmc_NodeBTBug_right:univ->univ,
  var_9_current:univ
]{
   not (
     isEmptyOrNull[var_9_current.ar_edu_itba_ayvmc_NodeBTBug_right]
     or 
     isEmptyOrNull[var_9_current]
   )

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition14[
  ar_edu_itba_ayvmc_NodeBTBug_right:univ->univ,
  var_9_current:univ
]{
   isEmptyOrNull[var_9_current.ar_edu_itba_ayvmc_NodeBTBug_right]
   or 
   isEmptyOrNull[var_9_current]

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition21[
  t_58:univ
]{
   t_58=true

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition22[
  t_58:univ
]{
   not (
     t_58=true)

}
pred precondition_ar_edu_itba_ayvmc_BinTreeBug_add_0[
  ar_edu_itba_ayvmc_BinTreeBug_root:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_left:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_right:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_value:univ->univ,
  n:univ,
  thiz:univ,
  throw:univ
]{
   ar_edu_itba_ayvmc_BinTreeBug_requires[ar_edu_itba_ayvmc_BinTreeBug_root,
                                        ar_edu_itba_ayvmc_NodeBTBug_left,
                                        ar_edu_itba_ayvmc_NodeBTBug_right,
                                        ar_edu_itba_ayvmc_NodeBTBug_value,
                                        n,
                                        thiz]
   and 
   equ[throw,
      null]
   and 
   (
     all objx:ar_edu_itba_ayvmc_BinTreeBug | {
       ar_edu_itba_ayvmc_BinTreeBug_object_invariant[ar_edu_itba_ayvmc_BinTreeBug_root,
                                                    ar_edu_itba_ayvmc_NodeBTBug_left,
                                                    ar_edu_itba_ayvmc_NodeBTBug_right,
                                                    ar_edu_itba_ayvmc_NodeBTBug_value,
                                                    n,
                                                    objx]
     
     }
   )

}
pred ar_edu_itba_ayvmc_BinTreeBug_ensures[
  throw':univ
]{
   (
     throw'=null)
   implies 
           liftExpression[true]

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition20[
  exit_stmt_reached:univ,
  throw:univ,
  var_10_ws_4:univ
]{
   liftExpression[var_10_ws_4]
   and 
   (
     throw=null)
   and 
   (
     exit_stmt_reached=false)

}
pred ar_edu_itba_ayvmc_BinTreeBug_requires[
  ar_edu_itba_ayvmc_BinTreeBug_root:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_left:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_right:univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_value:univ->univ,
  n:univ,
  thiz:univ
]{
   equ[fun_set_contains[fun_reach[thiz.ar_edu_itba_ayvmc_BinTreeBug_root,ar_edu_itba_ayvmc_NodeBTBug,ar_edu_itba_ayvmc_NodeBTBug_left+ar_edu_itba_ayvmc_NodeBTBug_right],n],
      false]
   and 
   equ[n.ar_edu_itba_ayvmc_NodeBTBug_left,
      null]
   and 
   equ[n.ar_edu_itba_ayvmc_NodeBTBug_right,
      null]
   and 
   equ[n.ar_edu_itba_ayvmc_NodeBTBug_value,
      0]
   and 
   (
     not (
       n=null)
   )

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition8[
  var_9_current:univ
]{
   isEmptyOrNull[var_9_current]

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition9[
  var_9_current:univ
]{
   not (
     isEmptyOrNull[var_9_current])

}
pred postcondition_ar_edu_itba_ayvmc_BinTreeBug_add_0[
  ar_edu_itba_ayvmc_BinTreeBug_root':univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_left':univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_right':univ->univ,
  ar_edu_itba_ayvmc_NodeBTBug_value':univ->univ,
  n':univ,
  throw':univ
]{
   ar_edu_itba_ayvmc_BinTreeBug_ensures[throw']
   and 
   (
     not (
       throw'=AssertionFailureLit)
   )
   and 
   (
     all objx':ar_edu_itba_ayvmc_BinTreeBug | {
       ar_edu_itba_ayvmc_BinTreeBug_object_invariant[ar_edu_itba_ayvmc_BinTreeBug_root',
                                                    ar_edu_itba_ayvmc_NodeBTBug_left',
                                                    ar_edu_itba_ayvmc_NodeBTBug_right',
                                                    ar_edu_itba_ayvmc_NodeBTBug_value',
                                                    n',
                                                    objx']
     
     }
   )

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition4[
  ar_edu_itba_ayvmc_BinTreeBug_root:univ->univ,
  thiz:univ
]{
   isEmptyOrNull[thiz.ar_edu_itba_ayvmc_BinTreeBug_root]
   or 
   isEmptyOrNull[thiz]

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition11[
  ar_edu_itba_ayvmc_NodeBTBug_left:univ->univ,
  var_9_current:univ
]{
   not (
     isEmptyOrNull[var_9_current.ar_edu_itba_ayvmc_NodeBTBug_left]
     or 
     isEmptyOrNull[var_9_current]
   )

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition10[
  ar_edu_itba_ayvmc_NodeBTBug_left:univ->univ,
  var_9_current:univ
]{
   isEmptyOrNull[var_9_current.ar_edu_itba_ayvmc_NodeBTBug_left]
   or 
   isEmptyOrNull[var_9_current]

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition12[
  t_54:univ
]{
   t_54=true

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition13[
  t_54:univ
]{
   not (
     t_54=true)

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition5[
  ar_edu_itba_ayvmc_BinTreeBug_root:univ->univ,
  thiz:univ
]{
   not (
     isEmptyOrNull[thiz.ar_edu_itba_ayvmc_BinTreeBug_root]
     or 
     isEmptyOrNull[thiz]
   )

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition6[
  thiz:univ
]{
   isEmptyOrNull[thiz]
   or 
   isEmptyOrNull[thiz]

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition7[
  thiz:univ
]{
   not (
     isEmptyOrNull[thiz]
     or 
     isEmptyOrNull[thiz]
   )

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition2[
  thiz:univ
]{
   isEmptyOrNull[thiz]

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition16[
  t_56:univ
]{
   t_56=true

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition3[
  thiz:univ
]{
   not (
     isEmptyOrNull[thiz])

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition17[
  t_56:univ
]{
   not (
     t_56=true)

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition18[
  t_57:univ
]{
   t_57=true

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition19[
  t_57:univ
]{
   not (
     t_57=true)

}
pred ar_edu_itba_ayvmc_BinTreeBugCondition1[
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
pred ar_edu_itba_ayvmc_BinTreeBugCondition0[
  exit_stmt_reached:univ,
  throw:univ
]{
   (
     throw=null)
   and 
   (
     exit_stmt_reached=false)

}
//-------------- ar_edu_itba_ayvmc_NodeBTBug--------------//
sig ar_edu_itba_ayvmc_NodeBTBug extends java_lang_Object {}
{}




//-------------- java_lang_Throwable--------------//
abstract sig java_lang_Throwable extends java_lang_Object {}
{}



one
sig java_lang_ThrowableLit extends java_lang_Throwable {}
{}

//-------------- java_lang_RuntimeException--------------//
abstract sig java_lang_RuntimeException extends java_lang_Exception {}
{}



one
sig java_lang_RuntimeExceptionLit extends java_lang_RuntimeException {}
{}

//-------------- java_lang_Object--------------//
abstract sig java_lang_Object {}
{}




//-------------- java_lang_Exception--------------//
abstract sig java_lang_Exception extends java_lang_Throwable {}
{}



one
sig java_lang_ExceptionLit extends java_lang_Exception {}
{}

//-------------- java_lang_NullPointerException--------------//
abstract one sig java_lang_NullPointerException extends java_lang_RuntimeException {}
{}



one
sig java_lang_NullPointerExceptionLit extends java_lang_NullPointerException {}
{}
check check_ar_edu_itba_ayvmc_BinTreeBug_add_0  for 0 but  exactly 1 ar_edu_itba_ayvmc_BinTreeBug, exactly 2 ar_edu_itba_ayvmc_NodeBTBug, 4 java_lang_Object,4 int



pred havocVariable2[
  u_1: univ -> univ
]{
  TruePred[]
  and 
  havocVariable2Post[u_1]
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


pred havocVariable3[
  u_1: univ -> ( seq univ )
]{
  TruePred[]
  and 
  havocVariable3Post[u_1]
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


pred updateVariable[
  l_1: univ,
  r_0: univ
]{
  TruePred[]
  and 
  equ[l_1,
     r_0]
}


pred havocVariable[
  v_1: univ
]{
  TruePred[]
  and 
  havocVarPost[v_1]
}


pred ar_edu_itba_ayvmc_BinTreeBug_add_0[
  thiz_0: ar_edu_itba_ayvmc_BinTreeBug,
  throw_1: java_lang_Throwable + null,
  throw_2: java_lang_Throwable + null,
  throw_3: java_lang_Throwable + null,
  throw_4: java_lang_Throwable + null,
  throw_5: java_lang_Throwable + null,
  throw_6: java_lang_Throwable + null,
  x_0: Int,
  n_0: ar_edu_itba_ayvmc_NodeBTBug + null,
  ar_edu_itba_ayvmc_NodeBTBug_right_0: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_NodeBTBug_right_1: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0: ( ar_edu_itba_ayvmc_BinTreeBug ) -> one ( Int ),
  ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1: ( ar_edu_itba_ayvmc_BinTreeBug ) -> one ( Int ),
  ar_edu_itba_ayvmc_BinTreeBug_root_0: ( ar_edu_itba_ayvmc_BinTreeBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_BinTreeBug_root_1: ( ar_edu_itba_ayvmc_BinTreeBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_NodeBTBug_value_0: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( Int ),
  ar_edu_itba_ayvmc_NodeBTBug_value_1: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( Int ),
  ar_edu_itba_ayvmc_NodeBTBug_left_0: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_NodeBTBug_left_1: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  t_52_0: Int,
  t_52_1: Int,
  exit_stmt_reached_1: boolean,
  param_x_5_0: Int,
  param_x_5_1: Int,
  param_n_6_0: ar_edu_itba_ayvmc_NodeBTBug + null,
  param_n_6_1: ar_edu_itba_ayvmc_NodeBTBug + null,
  t_57_0: boolean,
  t_57_1: boolean,
  t_58_0: boolean,
  t_58_1: boolean,
  var_10_ws_4_0: boolean,
  var_10_ws_4_1: boolean,
  var_10_ws_4_2: boolean,
  t_55_0: Int,
  t_55_1: Int,
  t_56_0: boolean,
  t_56_1: boolean,
  t_53_0: Int,
  t_53_1: Int,
  var_9_current_0: ar_edu_itba_ayvmc_NodeBTBug + null,
  var_9_current_1: ar_edu_itba_ayvmc_NodeBTBug + null,
  var_9_current_2: ar_edu_itba_ayvmc_NodeBTBug + null,
  t_54_0: boolean,
  t_54_1: boolean
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
      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                            throw_1]
      and 
      (
        param_x_5_1=x_0)
    )
    or 
    (
      (
        not (
          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        param_x_5_0=param_x_5_1)
    )
  )
  and 
  TruePred[]
  and 
  (
    (
      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                            throw_1]
      and 
      (
        param_n_6_1=n_0)
    )
    or 
    (
      (
        not (
          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        param_n_6_0=param_n_6_1)
    )
  )
  and 
  TruePred[]
  and 
  TruePred[]
  and 
  (
    (
      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                            throw_1]
      and 
      (
        (
          ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0]
          and 
          (
            throw_2=java_lang_NullPointerExceptionLit)
          and 
          (
            var_9_current_0=var_9_current_1)
        )
        or 
        (
          (
            not (
              ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0])
          )
          and 
          (
            var_9_current_1=thiz_0.ar_edu_itba_ayvmc_BinTreeBug_root_0)
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
          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_9_current_0=var_9_current_1)
      and 
      (
        throw_1=throw_2)
    )
  )
  and 
  (
    (
      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                            throw_2]
      and 
      (
        t_58_1=(equ[thiz_0.ar_edu_itba_ayvmc_BinTreeBug_root_0,
           null]=>(true)else(false))
      )
    )
    or 
    (
      (
        not (
          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                throw_2]
        )
      )
      and 
      TruePred[]
      and 
      (
        t_58_0=t_58_1)
    )
  )
  and 
  (
    (
      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                            throw_2]
      and 
      (
        (
          ar_edu_itba_ayvmc_BinTreeBugCondition21[t_58_1]
          and 
          TruePred[]
          and 
          (
            (
              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                    throw_2]
              and 
              (
                (
                  ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0]
                  and 
                  (
                    throw_3=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    ar_edu_itba_ayvmc_BinTreeBug_root_0=ar_edu_itba_ayvmc_BinTreeBug_root_1)
                )
                or 
                (
                  (
                    not (
                      ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0])
                  )
                  and 
                  (
                    ar_edu_itba_ayvmc_BinTreeBug_root_1=(ar_edu_itba_ayvmc_BinTreeBug_root_0)++((thiz_0)->(param_n_6_1)))
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
                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                        throw_2]
                )
              )
              and 
              TruePred[]
              and 
              (
                ar_edu_itba_ayvmc_BinTreeBug_root_0=ar_edu_itba_ayvmc_BinTreeBug_root_1)
              and 
              (
                throw_2=throw_3)
            )
          )
          and 
          (
            (
              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                    throw_3]
              and 
              (
                (
                  ar_edu_itba_ayvmc_BinTreeBugCondition4[ar_edu_itba_ayvmc_BinTreeBug_root_1,
                                                        thiz_0]
                  and 
                  (
                    throw_4=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                )
                or 
                (
                  (
                    not (
                      ar_edu_itba_ayvmc_BinTreeBugCondition4[ar_edu_itba_ayvmc_BinTreeBug_root_1,
                                                            thiz_0]
                    )
                  )
                  and 
                  (
                    ar_edu_itba_ayvmc_NodeBTBug_value_1=(ar_edu_itba_ayvmc_NodeBTBug_value_0)++((thiz_0.ar_edu_itba_ayvmc_BinTreeBug_root_1)->(param_x_5_1)))
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
                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                        throw_3]
                )
              )
              and 
              TruePred[]
              and 
              (
                ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
              and 
              (
                throw_3=throw_4)
            )
          )
          and 
          (
            (
              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                    throw_4]
              and 
              (
                (
                  ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0]
                  and 
                  (
                    throw_5=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    t_52_0=t_52_1)
                )
                or 
                (
                  (
                    not (
                      ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0])
                  )
                  and 
                  (
                    t_52_1=thiz_0.ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0)
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
                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                        throw_4]
                )
              )
              and 
              TruePred[]
              and 
              (
                t_52_0=t_52_1)
              and 
              (
                throw_4=throw_5)
            )
          )
          and 
          (
            (
              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                    throw_5]
              and 
              (
                (
                  ar_edu_itba_ayvmc_BinTreeBugCondition6[thiz_0]
                  and 
                  (
                    throw_6=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                )
                or 
                (
                  (
                    not (
                      ar_edu_itba_ayvmc_BinTreeBugCondition6[thiz_0])
                  )
                  and 
                  (
                    ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1=(ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0)++((thiz_0)->(add[thiz_0.ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0,1])))
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
                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                        throw_5]
                )
              )
              and 
              TruePred[]
              and 
              (
                ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
              and 
              (
                throw_5=throw_6)
            )
          )
          and 
          (
            var_10_ws_4_0=var_10_ws_4_2)
          and 
          (
            ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
          and 
          (
            t_56_0=t_56_1)
          and 
          (
            t_57_0=t_57_1)
          and 
          (
            t_54_0=t_54_1)
          and 
          (
            t_55_0=t_55_1)
          and 
          (
            ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
          and 
          (
            var_9_current_1=var_9_current_2)
          and 
          (
            t_53_0=t_53_1)
        )
        or 
        (
          (
            not (
              ar_edu_itba_ayvmc_BinTreeBugCondition21[t_58_1])
          )
          and 
          TruePred[]
          and 
          (
            (
              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                    throw_2]
              and 
              (
                var_10_ws_4_1=(neq[var_9_current_1.ar_edu_itba_ayvmc_NodeBTBug_value_0,
                   param_x_5_1]=>(true)else(false))
              )
            )
            or 
            (
              (
                not (
                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                        throw_2]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_10_ws_4_0=var_10_ws_4_1)
            )
          )
          and 
          (
            (
              ar_edu_itba_ayvmc_BinTreeBugCondition20[exit_stmt_reached_1,
                                                     throw_2,
                                                     var_10_ws_4_1]
              and 
              TruePred[]
              and 
              (
                (
                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                        throw_2]
                  and 
                  (
                    t_57_1=(lt[param_x_5_1,
                      var_9_current_1.ar_edu_itba_ayvmc_NodeBTBug_value_0]=>(true)else(false))
                  )
                )
                or 
                (
                  (
                    not (
                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                            throw_2]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    t_57_0=t_57_1)
                )
              )
              and 
              (
                (
                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                        throw_2]
                  and 
                  (
                    (
                      ar_edu_itba_ayvmc_BinTreeBugCondition18[t_57_1]
                      and 
                      TruePred[]
                      and 
                      (
                        (
                          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                throw_2]
                          and 
                          (
                            t_54_1=(equ[var_9_current_1.ar_edu_itba_ayvmc_NodeBTBug_left_0,
                               null]=>(true)else(false))
                          )
                        )
                        or 
                        (
                          (
                            not (
                              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                    throw_2]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            t_54_0=t_54_1)
                        )
                      )
                      and 
                      (
                        (
                          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                throw_2]
                          and 
                          (
                            (
                              ar_edu_itba_ayvmc_BinTreeBugCondition12[t_54_1]
                              and 
                              TruePred[]
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_2]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition8[var_9_current_1]
                                      and 
                                      (
                                        throw_3=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition8[var_9_current_1])
                                      )
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_NodeBTBug_left_1=(ar_edu_itba_ayvmc_NodeBTBug_left_0)++((var_9_current_1)->(param_n_6_1)))
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
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_2]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
                                  and 
                                  (
                                    throw_2=throw_3)
                                )
                              )
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_3]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition10[ar_edu_itba_ayvmc_NodeBTBug_left_1,
                                                                             var_9_current_1]
                                      and 
                                      (
                                        throw_4=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition10[ar_edu_itba_ayvmc_NodeBTBug_left_1,
                                                                                 var_9_current_1]
                                        )
                                      )
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_NodeBTBug_value_1=(ar_edu_itba_ayvmc_NodeBTBug_value_0)++((var_9_current_1.ar_edu_itba_ayvmc_NodeBTBug_left_1)->(param_x_5_1)))
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
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_3]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                                  and 
                                  (
                                    throw_3=throw_4)
                                )
                              )
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_4]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0]
                                      and 
                                      (
                                        throw_5=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        t_53_0=t_53_1)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0])
                                      )
                                      and 
                                      (
                                        t_53_1=thiz_0.ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0)
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
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_4]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    t_53_0=t_53_1)
                                  and 
                                  (
                                    throw_4=throw_5)
                                )
                              )
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_5]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition6[thiz_0]
                                      and 
                                      (
                                        throw_6=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition6[thiz_0])
                                      )
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1=(ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0)++((thiz_0)->(add[thiz_0.ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0,1])))
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
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_5]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                                  and 
                                  (
                                    throw_5=throw_6)
                                )
                              )
                              and 
                              (
                                var_9_current_1=var_9_current_2)
                            )
                            or 
                            (
                              (
                                not (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition12[t_54_1])
                              )
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_2]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition8[var_9_current_1]
                                      and 
                                      (
                                        throw_6=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        var_9_current_1=var_9_current_2)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition8[var_9_current_1])
                                      )
                                      and 
                                      (
                                        var_9_current_2=var_9_current_1.ar_edu_itba_ayvmc_NodeBTBug_left_0)
                                      and 
                                      (
                                        throw_2=throw_6)
                                    )
                                  )
                                )
                                or 
                                (
                                  (
                                    not (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_2]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_9_current_1=var_9_current_2)
                                  and 
                                  (
                                    throw_2=throw_6)
                                )
                              )
                              and 
                              (
                                ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                              and 
                              (
                                ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                              and 
                              (
                                t_53_0=t_53_1)
                              and 
                              (
                                ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                    throw_2]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                          and 
                          (
                            ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
                          and 
                          (
                            var_9_current_1=var_9_current_2)
                          and 
                          (
                            ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                          and 
                          (
                            t_53_0=t_53_1)
                          and 
                          (
                            throw_2=throw_6)
                        )
                      )
                      and 
                      (
                        ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
                      and 
                      (
                        t_56_0=t_56_1)
                      and 
                      (
                        t_55_0=t_55_1)
                    )
                    or 
                    (
                      (
                        not (
                          ar_edu_itba_ayvmc_BinTreeBugCondition18[t_57_1])
                      )
                      and 
                      TruePred[]
                      and 
                      (
                        (
                          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                throw_2]
                          and 
                          (
                            t_56_1=(equ[var_9_current_1.ar_edu_itba_ayvmc_NodeBTBug_right_0,
                               null]=>(true)else(false))
                          )
                        )
                        or 
                        (
                          (
                            not (
                              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                    throw_2]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            t_56_0=t_56_1)
                        )
                      )
                      and 
                      (
                        (
                          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                throw_2]
                          and 
                          (
                            (
                              ar_edu_itba_ayvmc_BinTreeBugCondition16[t_56_1]
                              and 
                              TruePred[]
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_2]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition8[var_9_current_1]
                                      and 
                                      (
                                        throw_3=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition8[var_9_current_1])
                                      )
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_NodeBTBug_right_1=(ar_edu_itba_ayvmc_NodeBTBug_right_0)++((var_9_current_1)->(param_n_6_1)))
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
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_2]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
                                  and 
                                  (
                                    throw_2=throw_3)
                                )
                              )
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_3]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition14[ar_edu_itba_ayvmc_NodeBTBug_right_1,
                                                                             var_9_current_1]
                                      and 
                                      (
                                        throw_4=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition14[ar_edu_itba_ayvmc_NodeBTBug_right_1,
                                                                                 var_9_current_1]
                                        )
                                      )
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_NodeBTBug_value_1=(ar_edu_itba_ayvmc_NodeBTBug_value_0)++((var_9_current_1.ar_edu_itba_ayvmc_NodeBTBug_right_1)->(param_x_5_1)))
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
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_3]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                                  and 
                                  (
                                    throw_3=throw_4)
                                )
                              )
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_4]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0]
                                      and 
                                      (
                                        throw_5=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        t_55_0=t_55_1)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition2[thiz_0])
                                      )
                                      and 
                                      (
                                        t_55_1=thiz_0.ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0)
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
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_4]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    t_55_0=t_55_1)
                                  and 
                                  (
                                    throw_4=throw_5)
                                )
                              )
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_5]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition6[thiz_0]
                                      and 
                                      (
                                        throw_6=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition6[thiz_0])
                                      )
                                      and 
                                      (
                                        ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1=(ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0)++((thiz_0)->(add[thiz_0.ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0,1])))
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
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_5]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                                  and 
                                  (
                                    throw_5=throw_6)
                                )
                              )
                              and 
                              (
                                var_9_current_1=var_9_current_2)
                            )
                            or 
                            (
                              (
                                not (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition16[t_56_1])
                              )
                              and 
                              (
                                (
                                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                        throw_2]
                                  and 
                                  (
                                    (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition8[var_9_current_1]
                                      and 
                                      (
                                        throw_6=java_lang_NullPointerExceptionLit)
                                      and 
                                      (
                                        var_9_current_1=var_9_current_2)
                                    )
                                    or 
                                    (
                                      (
                                        not (
                                          ar_edu_itba_ayvmc_BinTreeBugCondition8[var_9_current_1])
                                      )
                                      and 
                                      (
                                        var_9_current_2=var_9_current_1.ar_edu_itba_ayvmc_NodeBTBug_right_0)
                                      and 
                                      (
                                        throw_2=throw_6)
                                    )
                                  )
                                )
                                or 
                                (
                                  (
                                    not (
                                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                            throw_2]
                                    )
                                  )
                                  and 
                                  TruePred[]
                                  and 
                                  (
                                    var_9_current_1=var_9_current_2)
                                  and 
                                  (
                                    throw_2=throw_6)
                                )
                              )
                              and 
                              (
                                ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                              and 
                              (
                                t_55_0=t_55_1)
                              and 
                              (
                                ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                              and 
                              (
                                ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
                            )
                          )
                        )
                        or 
                        (
                          (
                            not (
                              ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                                    throw_2]
                            )
                          )
                          and 
                          TruePred[]
                          and 
                          (
                            ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                          and 
                          (
                            ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
                          and 
                          (
                            t_55_0=t_55_1)
                          and 
                          (
                            var_9_current_1=var_9_current_2)
                          and 
                          (
                            ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                          and 
                          (
                            throw_2=throw_6)
                        )
                      )
                      and 
                      (
                        t_54_0=t_54_1)
                      and 
                      (
                        ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
                      and 
                      (
                        t_53_0=t_53_1)
                    )
                  )
                )
                or 
                (
                  (
                    not (
                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                            throw_2]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
                  and 
                  (
                    ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
                  and 
                  (
                    t_56_0=t_56_1)
                  and 
                  (
                    t_54_0=t_54_1)
                  and 
                  (
                    t_55_0=t_55_1)
                  and 
                  (
                    ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
                  and 
                  (
                    var_9_current_1=var_9_current_2)
                  and 
                  (
                    ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
                  and 
                  (
                    t_53_0=t_53_1)
                  and 
                  (
                    throw_2=throw_6)
                )
              )
              and 
              (
                (
                  ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                        throw_6]
                  and 
                  (
                    var_10_ws_4_2=(neq[var_9_current_2.ar_edu_itba_ayvmc_NodeBTBug_value_1,
                       param_x_5_1]=>(true)else(false))
                  )
                )
                or 
                (
                  (
                    not (
                      ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                            throw_6]
                    )
                  )
                  and 
                  TruePred[]
                  and 
                  (
                    var_10_ws_4_1=var_10_ws_4_2)
                )
              )
              and 
              TruePred[]
            )
            or 
            (
              (
                not (
                  ar_edu_itba_ayvmc_BinTreeBugCondition20[exit_stmt_reached_1,
                                                         throw_2,
                                                         var_10_ws_4_1]
                )
              )
              and 
              TruePred[]
              and 
              (
                ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
              and 
              (
                ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
              and 
              (
                t_56_0=t_56_1)
              and 
              (
                t_57_0=t_57_1)
              and 
              (
                t_54_0=t_54_1)
              and 
              (
                t_55_0=t_55_1)
              and 
              (
                ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
              and 
              (
                var_9_current_1=var_9_current_2)
              and 
              (
                ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
              and 
              (
                t_53_0=t_53_1)
              and 
              (
                throw_2=throw_6)
              and 
              (
                var_10_ws_4_1=var_10_ws_4_2)
            )
          )
          and 
          (
            not (
              ar_edu_itba_ayvmc_BinTreeBugCondition20[exit_stmt_reached_1,
                                                     throw_6,
                                                     var_10_ws_4_2]
            )
          )
          and 
          (
            ar_edu_itba_ayvmc_BinTreeBug_root_0=ar_edu_itba_ayvmc_BinTreeBug_root_1)
          and 
          (
            t_52_0=t_52_1)
        )
      )
    )
    or 
    (
      (
        not (
          ar_edu_itba_ayvmc_BinTreeBugCondition0[exit_stmt_reached_1,
                                                throw_2]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_10_ws_4_0=var_10_ws_4_2)
      and 
      (
        ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0=ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1)
      and 
      (
        ar_edu_itba_ayvmc_NodeBTBug_right_0=ar_edu_itba_ayvmc_NodeBTBug_right_1)
      and 
      (
        ar_edu_itba_ayvmc_BinTreeBug_root_0=ar_edu_itba_ayvmc_BinTreeBug_root_1)
      and 
      (
        t_56_0=t_56_1)
      and 
      (
        t_57_0=t_57_1)
      and 
      (
        t_54_0=t_54_1)
      and 
      (
        t_55_0=t_55_1)
      and 
      (
        ar_edu_itba_ayvmc_NodeBTBug_left_0=ar_edu_itba_ayvmc_NodeBTBug_left_1)
      and 
      (
        var_9_current_1=var_9_current_2)
      and 
      (
        ar_edu_itba_ayvmc_NodeBTBug_value_0=ar_edu_itba_ayvmc_NodeBTBug_value_1)
      and 
      (
        t_52_0=t_52_1)
      and 
      (
        t_53_0=t_53_1)
      and 
      (
        throw_2=throw_6)
    )
  )
  and 
  TruePred[]

}

one sig QF {
  ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0: ( ar_edu_itba_ayvmc_BinTreeBug ) -> one ( Int ),
  ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1: ( ar_edu_itba_ayvmc_BinTreeBug ) -> one ( Int ),
  ar_edu_itba_ayvmc_BinTreeBug_root_0: ( ar_edu_itba_ayvmc_BinTreeBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_BinTreeBug_root_1: ( ar_edu_itba_ayvmc_BinTreeBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_NodeBTBug_left_0: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_NodeBTBug_left_1: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_NodeBTBug_right_0: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_NodeBTBug_right_1: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( ar_edu_itba_ayvmc_NodeBTBug + null ),
  ar_edu_itba_ayvmc_NodeBTBug_value_0: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( Int ),
  ar_edu_itba_ayvmc_NodeBTBug_value_1: ( ar_edu_itba_ayvmc_NodeBTBug ) -> one ( Int ),
  l0_exit_stmt_reached_1: boolean,
  l0_param_n_6_0: ar_edu_itba_ayvmc_NodeBTBug + null,
  l0_param_n_6_1: ar_edu_itba_ayvmc_NodeBTBug + null,
  l0_param_x_5_0: Int,
  l0_param_x_5_1: Int,
  l0_t_52_0: Int,
  l0_t_52_1: Int,
  l0_t_53_0: Int,
  l0_t_53_1: Int,
  l0_t_54_0: boolean,
  l0_t_54_1: boolean,
  l0_t_55_0: Int,
  l0_t_55_1: Int,
  l0_t_56_0: boolean,
  l0_t_56_1: boolean,
  l0_t_57_0: boolean,
  l0_t_57_1: boolean,
  l0_t_58_0: boolean,
  l0_t_58_1: boolean,
  l0_var_10_ws_4_0: boolean,
  l0_var_10_ws_4_1: boolean,
  l0_var_10_ws_4_2: boolean,
  l0_var_9_current_0: ar_edu_itba_ayvmc_NodeBTBug + null,
  l0_var_9_current_1: ar_edu_itba_ayvmc_NodeBTBug + null,
  l0_var_9_current_2: ar_edu_itba_ayvmc_NodeBTBug + null,
  n_0: ar_edu_itba_ayvmc_NodeBTBug + null,
  thiz_0: ar_edu_itba_ayvmc_BinTreeBug,
  throw_0: java_lang_Throwable + null,
  throw_1: java_lang_Throwable + null,
  throw_2: java_lang_Throwable + null,
  throw_3: java_lang_Throwable + null,
  throw_4: java_lang_Throwable + null,
  throw_5: java_lang_Throwable + null,
  throw_6: java_lang_Throwable + null,
  x_0: Int
}


fact {
  precondition_ar_edu_itba_ayvmc_BinTreeBug_add_0[QF.ar_edu_itba_ayvmc_BinTreeBug_root_0,
                                                 QF.ar_edu_itba_ayvmc_NodeBTBug_left_0,
                                                 QF.ar_edu_itba_ayvmc_NodeBTBug_right_0,
                                                 QF.ar_edu_itba_ayvmc_NodeBTBug_value_0,
                                                 QF.n_0,
                                                 QF.thiz_0,
                                                 QF.throw_0]

}

fact {
  ar_edu_itba_ayvmc_BinTreeBug_add_0[QF.thiz_0,
                                    QF.throw_1,
                                    QF.throw_2,
                                    QF.throw_3,
                                    QF.throw_4,
                                    QF.throw_5,
                                    QF.throw_6,
                                    QF.x_0,
                                    QF.n_0,
                                    QF.ar_edu_itba_ayvmc_NodeBTBug_right_0,
                                    QF.ar_edu_itba_ayvmc_NodeBTBug_right_1,
                                    QF.ar_edu_itba_ayvmc_BinTreeBug_intendedSize_0,
                                    QF.ar_edu_itba_ayvmc_BinTreeBug_intendedSize_1,
                                    QF.ar_edu_itba_ayvmc_BinTreeBug_root_0,
                                    QF.ar_edu_itba_ayvmc_BinTreeBug_root_1,
                                    QF.ar_edu_itba_ayvmc_NodeBTBug_value_0,
                                    QF.ar_edu_itba_ayvmc_NodeBTBug_value_1,
                                    QF.ar_edu_itba_ayvmc_NodeBTBug_left_0,
                                    QF.ar_edu_itba_ayvmc_NodeBTBug_left_1,
                                    QF.l0_t_52_0,
                                    QF.l0_t_52_1,
                                    QF.l0_exit_stmt_reached_1,
                                    QF.l0_param_x_5_0,
                                    QF.l0_param_x_5_1,
                                    QF.l0_param_n_6_0,
                                    QF.l0_param_n_6_1,
                                    QF.l0_t_57_0,
                                    QF.l0_t_57_1,
                                    QF.l0_t_58_0,
                                    QF.l0_t_58_1,
                                    QF.l0_var_10_ws_4_0,
                                    QF.l0_var_10_ws_4_1,
                                    QF.l0_var_10_ws_4_2,
                                    QF.l0_t_55_0,
                                    QF.l0_t_55_1,
                                    QF.l0_t_56_0,
                                    QF.l0_t_56_1,
                                    QF.l0_t_53_0,
                                    QF.l0_t_53_1,
                                    QF.l0_var_9_current_0,
                                    QF.l0_var_9_current_1,
                                    QF.l0_var_9_current_2,
                                    QF.l0_t_54_0,
                                    QF.l0_t_54_1]

}

assert check_ar_edu_itba_ayvmc_BinTreeBug_add_0{
  postcondition_ar_edu_itba_ayvmc_BinTreeBug_add_0[QF.ar_edu_itba_ayvmc_BinTreeBug_root_1,
                                                  QF.ar_edu_itba_ayvmc_NodeBTBug_left_1,
                                                  QF.ar_edu_itba_ayvmc_NodeBTBug_right_1,
                                                  QF.ar_edu_itba_ayvmc_NodeBTBug_value_1,
                                                  QF.n_0,
                                                  QF.throw_6]
}
