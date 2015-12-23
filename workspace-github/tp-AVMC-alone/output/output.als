/* 
 * DynAlloy translator options 
 * --------------------------- 
 * assertionId= check_ar_edu_itba_ayvmc_ejemplooo_wololoInt_0
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

//-------------- ar_edu_itba_ayvmc_ejemplooo--------------//
sig ar_edu_itba_ayvmc_ejemplooo extends java_lang_Object {}
{}
pred ar_edu_itba_ayvmc_ejemploooCondition4[
  t_4:univ
]{
   t_4=true

}
pred ar_edu_itba_ayvmc_ejemplooo_requires[
  ar_edu_itba_ayvmc_ejemplooo_canarywololoInti:univ->univ,
  thiz:univ
]{
   equ[thiz.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti,
      false]

}
pred precondition_ar_edu_itba_ayvmc_ejemplooo_wololoInt_0[
  ar_edu_itba_ayvmc_ejemplooo_canarywololoInti:univ->univ,
  thiz:univ,
  throw:univ
]{
   ar_edu_itba_ayvmc_ejemplooo_requires[ar_edu_itba_ayvmc_ejemplooo_canarywololoInti,
                                       thiz]
   and 
   equ[throw,
      null]

}
pred ar_edu_itba_ayvmc_ejemploooCondition5[
  t_4:univ
]{
   not (
     t_4=true)

}
pred ar_edu_itba_ayvmc_ejemploooCondition0[
  exit_stmt_reached:univ,
  throw:univ
]{
   (
     throw=null)
   and 
   (
     exit_stmt_reached=false)

}
pred ar_edu_itba_ayvmc_ejemploooCondition3[
  thiz:univ
]{
   not (
     isEmptyOrNull[thiz])

}
pred ar_edu_itba_ayvmc_ejemploooCondition1[
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
pred ar_edu_itba_ayvmc_ejemplooo_ensures[
  ar_edu_itba_ayvmc_ejemplooo_canarywololoInti':univ->univ,
  thiz':univ,
  throw':univ
]{
   (
     throw'=null)
   implies 
           equ[thiz'.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti',
              false]

}
pred ar_edu_itba_ayvmc_ejemploooCondition2[
  thiz:univ
]{
   isEmptyOrNull[thiz]

}
pred postcondition_ar_edu_itba_ayvmc_ejemplooo_wololoInt_0[
  ar_edu_itba_ayvmc_ejemplooo_canarywololoInti':univ->univ,
  thiz':univ,
  throw':univ
]{
   ar_edu_itba_ayvmc_ejemplooo_ensures[ar_edu_itba_ayvmc_ejemplooo_canarywololoInti',
                                      thiz',
                                      throw']
   and 
   (
     not (
       throw'=AssertionFailureLit)
   )

}
//-------------- java_lang_NullPointerException--------------//
abstract one sig java_lang_NullPointerException extends java_lang_RuntimeException {}
{}



one
sig java_lang_NullPointerExceptionLit extends java_lang_NullPointerException {}
{}
check check_ar_edu_itba_ayvmc_ejemplooo_wololoInt_0  for 0 but  1 java_lang_Object, exactly 1 ar_edu_itba_ayvmc_ejemplooo,4 int



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


pred ar_edu_itba_ayvmc_ejemplooo_wololoInt_0[
  thiz_0: ar_edu_itba_ayvmc_ejemplooo,
  throw_1: java_lang_Throwable + null,
  throw_2: java_lang_Throwable + null,
  ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0: ( ar_edu_itba_ayvmc_ejemplooo ) -> one ( boolean ),
  ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1: ( ar_edu_itba_ayvmc_ejemplooo ) -> one ( boolean ),
  var_4_i_0: Int,
  var_4_i_1: Int,
  var_4_i_2: Int,
  exit_stmt_reached_1: boolean,
  t_4_0: boolean,
  t_4_1: boolean
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
  TruePred[]
  and 
  (
    (
      ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                           throw_1]
      and 
      (
        var_4_i_1=0)
    )
    or 
    (
      (
        not (
          ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                               throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_4_i_0=var_4_i_1)
    )
  )
  and 
  (
    (
      ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                           throw_1]
      and 
      (
        t_4_1=(equ[var_4_i_1,
           0]=>(true)else(false))
      )
    )
    or 
    (
      (
        not (
          ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                               throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        t_4_0=t_4_1)
    )
  )
  and 
  (
    (
      ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                           throw_1]
      and 
      (
        (
          ar_edu_itba_ayvmc_ejemploooCondition4[t_4_1]
          and 
          (
            (
              ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                                   throw_1]
              and 
              (
                (
                  ar_edu_itba_ayvmc_ejemploooCondition2[thiz_0]
                  and 
                  (
                    throw_2=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0=ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1)
                )
                or 
                (
                  (
                    not (
                      ar_edu_itba_ayvmc_ejemploooCondition2[thiz_0])
                  )
                  and 
                  (
                    ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1=(ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0)++((thiz_0)->(true)))
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
                  ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                                       throw_1]
                )
              )
              and 
              TruePred[]
              and 
              (
                ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0=ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1)
              and 
              (
                throw_1=throw_2)
            )
          )
          and 
          (
            var_4_i_1=var_4_i_2)
        )
        or 
        (
          (
            not (
              ar_edu_itba_ayvmc_ejemploooCondition4[t_4_1])
          )
          and 
          (
            (
              ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                                   throw_1]
              and 
              (
                var_4_i_2=1)
            )
            or 
            (
              (
                not (
                  ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                                       throw_1]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_4_i_1=var_4_i_2)
            )
          )
          and 
          (
            ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0=ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1)
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
          ar_edu_itba_ayvmc_ejemploooCondition0[exit_stmt_reached_1,
                                               throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_4_i_1=var_4_i_2)
      and 
      (
        ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0=ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1)
      and 
      (
        throw_1=throw_2)
    )
  )
  and 
  TruePred[]

}

one sig QF {
  ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0: ( ar_edu_itba_ayvmc_ejemplooo ) -> one ( boolean ),
  ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1: ( ar_edu_itba_ayvmc_ejemplooo ) -> one ( boolean ),
  l0_exit_stmt_reached_1: boolean,
  l0_t_4_0: boolean,
  l0_t_4_1: boolean,
  l0_var_4_i_0: Int,
  l0_var_4_i_1: Int,
  l0_var_4_i_2: Int,
  thiz_0: ar_edu_itba_ayvmc_ejemplooo,
  throw_0: java_lang_Throwable + null,
  throw_1: java_lang_Throwable + null,
  throw_2: java_lang_Throwable + null
}


fact {
  precondition_ar_edu_itba_ayvmc_ejemplooo_wololoInt_0[QF.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0,
                                                      QF.thiz_0,
                                                      QF.throw_0]

}

fact {
  ar_edu_itba_ayvmc_ejemplooo_wololoInt_0[QF.thiz_0,
                                         QF.throw_1,
                                         QF.throw_2,
                                         QF.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_0,
                                         QF.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1,
                                         QF.l0_var_4_i_0,
                                         QF.l0_var_4_i_1,
                                         QF.l0_var_4_i_2,
                                         QF.l0_exit_stmt_reached_1,
                                         QF.l0_t_4_0,
                                         QF.l0_t_4_1]

}

assert check_ar_edu_itba_ayvmc_ejemplooo_wololoInt_0{
  postcondition_ar_edu_itba_ayvmc_ejemplooo_wololoInt_0[QF.ar_edu_itba_ayvmc_ejemplooo_canarywololoInti_1,
                                                       QF.thiz_0,
                                                       QF.throw_2]
}
