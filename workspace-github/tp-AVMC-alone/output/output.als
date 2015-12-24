/* 
 * DynAlloy translator options 
 * --------------------------- 
 * assertionId= check_testing_examples_ejemplo_wololoInt_0
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
//-------------- ClassFields--------------//
one
sig ClassFields {}
{}




//-------------- java_lang_Throwable--------------//
abstract sig java_lang_Throwable extends java_lang_Object {}
{}



one
sig java_lang_ThrowableLit extends java_lang_Throwable {}
{}

//-------------- testing_examples_ejemplo--------------//
sig testing_examples_ejemplo extends java_lang_Object {}
{}
pred testing_examples_ejemploCondition2[
]{
   isEmptyOrNull[ClassFields]

}
pred testing_examples_ejemploCondition3[
]{
   not (
     isEmptyOrNull[ClassFields])

}
pred testing_examples_ejemplo_requires[
  testing_examples_ejemplo_canarywololoInta:univ->univ,
  testing_examples_ejemplo_canarywololoIntc:univ->univ,
  testing_examples_ejemplo_canarywololoIntd:univ->univ
]{
   equ[ClassFields.testing_examples_ejemplo_canarywololoInta,
      false]
   and 
   equ[ClassFields.testing_examples_ejemplo_canarywololoIntc,
      false]
   and 
   equ[ClassFields.testing_examples_ejemplo_canarywololoIntd,
      false]

}
pred postcondition_testing_examples_ejemplo_wololoInt_0[
  testing_examples_ejemplo_canarywololoInta':univ->univ,
  testing_examples_ejemplo_canarywololoIntc':univ->univ,
  testing_examples_ejemplo_canarywololoIntd':univ->univ,
  throw':univ
]{
   testing_examples_ejemplo_ensures[testing_examples_ejemplo_canarywololoInta',
                                   testing_examples_ejemplo_canarywololoIntc',
                                   testing_examples_ejemplo_canarywololoIntd',
                                   throw']
   and 
   (
     not (
       throw'=AssertionFailureLit)
   )

}
pred testing_examples_ejemploCondition0[
  exit_stmt_reached:univ,
  throw:univ
]{
   (
     throw=null)
   and 
   (
     exit_stmt_reached=false)

}
pred testing_examples_ejemploCondition1[
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
pred precondition_testing_examples_ejemplo_wololoInt_0[
  testing_examples_ejemplo_canarywololoInta:univ->univ,
  testing_examples_ejemplo_canarywololoIntc:univ->univ,
  testing_examples_ejemplo_canarywololoIntd:univ->univ,
  throw:univ
]{
   equ[throw,
      null]
   and 
   testing_examples_ejemplo_requires[testing_examples_ejemplo_canarywololoInta,
                                    testing_examples_ejemplo_canarywololoIntc,
                                    testing_examples_ejemplo_canarywololoIntd]

}
pred testing_examples_ejemploCondition5[
  t_8:univ
]{
   not (
     t_8=true)

}
pred testing_examples_ejemploCondition4[
  t_8:univ
]{
   t_8=true

}
pred testing_examples_ejemplo_ensures[
  testing_examples_ejemplo_canarywololoInta':univ->univ,
  testing_examples_ejemplo_canarywololoIntc':univ->univ,
  testing_examples_ejemplo_canarywololoIntd':univ->univ,
  throw':univ
]{
   (
     throw'=null)
   implies 
           (
             equ[ClassFields.testing_examples_ejemplo_canarywololoInta',
                false]
             and 
             equ[ClassFields.testing_examples_ejemplo_canarywololoIntc',
                false]
             and 
             equ[ClassFields.testing_examples_ejemplo_canarywololoIntd',
                false]
           )

}
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
check check_testing_examples_ejemplo_wololoInt_0  for 0 but  exactly 1 testing_examples_ejemplo, 0 java_lang_Object,4 int



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


pred testing_examples_ejemplo_wololoInt_0[
  throw_1: java_lang_Throwable + null,
  throw_2: java_lang_Throwable + null,
  return_0: Int,
  return_1: Int,
  testing_examples_ejemplo_canarywololoIntc_0: ( ClassFields ) -> one ( boolean ),
  testing_examples_ejemplo_canarywololoIntc_1: ( ClassFields ) -> one ( boolean ),
  var_9_c_0: Int,
  var_9_c_1: Int,
  var_8_a_0: Int,
  var_8_a_1: Int,
  var_8_a_2: Int,
  exit_stmt_reached_1: boolean,
  exit_stmt_reached_2: boolean,
  var_10_d_0: Int,
  var_10_d_1: Int,
  t_8_0: boolean,
  t_8_1: boolean
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
      testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                        throw_1]
      and 
      (
        var_8_a_1=1)
    )
    or 
    (
      (
        not (
          testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                            throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_8_a_0=var_8_a_1)
    )
  )
  and 
  TruePred[]
  and 
  (
    (
      testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                        throw_1]
      and 
      (
        var_9_c_1=1)
    )
    or 
    (
      (
        not (
          testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                            throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_9_c_0=var_9_c_1)
    )
  )
  and 
  TruePred[]
  and 
  (
    (
      testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                        throw_1]
      and 
      (
        var_10_d_1=0)
    )
    or 
    (
      (
        not (
          testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                            throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_10_d_0=var_10_d_1)
    )
  )
  and 
  (
    (
      testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                        throw_1]
      and 
      (
        t_8_1=(equ[var_9_c_1,
           0]=>(true)else(false))
      )
    )
    or 
    (
      (
        not (
          testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                            throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        t_8_0=t_8_1)
    )
  )
  and 
  (
    (
      testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                        throw_1]
      and 
      (
        (
          testing_examples_ejemploCondition4[t_8_1]
          and 
          (
            (
              testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                                throw_1]
              and 
              (
                (
                  testing_examples_ejemploCondition2[]
                  and 
                  (
                    throw_2=java_lang_NullPointerExceptionLit)
                  and 
                  (
                    testing_examples_ejemplo_canarywololoIntc_0=testing_examples_ejemplo_canarywololoIntc_1)
                )
                or 
                (
                  (
                    not (
                      testing_examples_ejemploCondition2[])
                  )
                  and 
                  (
                    testing_examples_ejemplo_canarywololoIntc_1=(testing_examples_ejemplo_canarywololoIntc_0)++((ClassFields)->(true)))
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
                  testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                                    throw_1]
                )
              )
              and 
              TruePred[]
              and 
              (
                testing_examples_ejemplo_canarywololoIntc_0=testing_examples_ejemplo_canarywololoIntc_1)
              and 
              (
                throw_1=throw_2)
            )
          )
          and 
          (
            var_8_a_1=var_8_a_2)
        )
        or 
        (
          (
            not (
              testing_examples_ejemploCondition4[t_8_1])
          )
          and 
          (
            (
              testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                                throw_1]
              and 
              (
                var_8_a_2=div[var_8_a_1,var_9_c_1])
            )
            or 
            (
              (
                not (
                  testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                                    throw_1]
                )
              )
              and 
              TruePred[]
              and 
              (
                var_8_a_1=var_8_a_2)
            )
          )
          and 
          (
            testing_examples_ejemplo_canarywololoIntc_0=testing_examples_ejemplo_canarywololoIntc_1)
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
          testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                            throw_1]
        )
      )
      and 
      TruePred[]
      and 
      (
        var_8_a_1=var_8_a_2)
      and 
      (
        testing_examples_ejemplo_canarywololoIntc_0=testing_examples_ejemplo_canarywololoIntc_1)
      and 
      (
        throw_1=throw_2)
    )
  )
  and 
  (
    (
      testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                        throw_2]
      and 
      (
        return_1=1)
      and 
      (
        exit_stmt_reached_2=true)
    )
    or 
    (
      (
        not (
          testing_examples_ejemploCondition0[exit_stmt_reached_1,
                                            throw_2]
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
  TruePred[]

}

one sig QF {
  l0_exit_stmt_reached_1: boolean,
  l0_exit_stmt_reached_2: boolean,
  l0_t_8_0: boolean,
  l0_t_8_1: boolean,
  l0_var_10_d_0: Int,
  l0_var_10_d_1: Int,
  l0_var_8_a_0: Int,
  l0_var_8_a_1: Int,
  l0_var_8_a_2: Int,
  l0_var_9_c_0: Int,
  l0_var_9_c_1: Int,
  return_0: Int,
  return_1: Int,
  testing_examples_ejemplo_canarywololoInta_0: ( ClassFields ) -> one ( boolean ),
  testing_examples_ejemplo_canarywololoIntc_0: ( ClassFields ) -> one ( boolean ),
  testing_examples_ejemplo_canarywololoIntc_1: ( ClassFields ) -> one ( boolean ),
  testing_examples_ejemplo_canarywololoIntd_0: ( ClassFields ) -> one ( boolean ),
  throw_0: java_lang_Throwable + null,
  throw_1: java_lang_Throwable + null,
  throw_2: java_lang_Throwable + null
}


fact {
  precondition_testing_examples_ejemplo_wololoInt_0[QF.testing_examples_ejemplo_canarywololoInta_0,
                                                   QF.testing_examples_ejemplo_canarywololoIntc_0,
                                                   QF.testing_examples_ejemplo_canarywololoIntd_0,
                                                   QF.throw_0]

}

fact {
  testing_examples_ejemplo_wololoInt_0[QF.throw_1,
                                      QF.throw_2,
                                      QF.return_0,
                                      QF.return_1,
                                      QF.testing_examples_ejemplo_canarywololoIntc_0,
                                      QF.testing_examples_ejemplo_canarywololoIntc_1,
                                      QF.l0_var_9_c_0,
                                      QF.l0_var_9_c_1,
                                      QF.l0_var_8_a_0,
                                      QF.l0_var_8_a_1,
                                      QF.l0_var_8_a_2,
                                      QF.l0_exit_stmt_reached_1,
                                      QF.l0_exit_stmt_reached_2,
                                      QF.l0_var_10_d_0,
                                      QF.l0_var_10_d_1,
                                      QF.l0_t_8_0,
                                      QF.l0_t_8_1]

}

assert check_testing_examples_ejemplo_wololoInt_0{
  postcondition_testing_examples_ejemplo_wololoInt_0[QF.testing_examples_ejemplo_canarywololoInta_0,
                                                    QF.testing_examples_ejemplo_canarywololoIntc_1,
                                                    QF.testing_examples_ejemplo_canarywololoIntd_0,
                                                    QF.throw_2]
}
