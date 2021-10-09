###### 编号1
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/agreement/blob/production/agreement-core/src/main/resources/mapper/RiskPricingInfoMapper.xml](https://git.wolaidai.com/WelabCo/TC/agreement/blob/production/agreement-core/src/main/resources/mapper/RiskPricingInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="updateFinalClassByApplicationId" parameterType="java.lang.String">
		update risk_pricing_infos set final_class = #{finalClass}, updated_at = now() WHERE application_id = #{applicationId}
	</select>
```

###### 编号2
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/aibank-channel/blob/production/src/main/resources/mapper/AccountsSuMapper.xml](https://git.wolaidai.com/WelabCo/Finance/aibank-channel/blob/production/src/main/resources/mapper/AccountsSuMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertAccountsSu">
        insert into accounts_su(account_id, owner_id, owner_type, pay_code, balance, cash_balance,
        freeze_balance, withdraw_balance, created_at, updated_at)
        values(#{accountId},#{ownerId},#{ownerType},#{payCode}, 0.00, 0.00, 0.00, 0.00, now(),
        now())
    </insert>
```

###### 编号3
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/aibank-channel/blob/production/src/main/resources/mapper/AibankLedgerPlanDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/aibank-channel/blob/production/src/main/resources/mapper/AibankLedgerPlanDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDistributePlan">
    update aibank_ledger_plan_details
    set distribute_plan = #{distributePlan},updated_at = now()
    where account_id = #{accountId} and due_day = #{dueDay} and distribute_plan is null
  </update>
```

###### 编号4
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/aibank-channel/blob/production/src/main/resources/mapper/AibankLedgerPlanMapper.xml](https://git.wolaidai.com/WelabCo/Finance/aibank-channel/blob/production/src/main/resources/mapper/AibankLedgerPlanMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.aibankchannel.model.AibankLedgerPlan">
    update aibank_ledger_plan
    <set>
      <if test="step != null">step = #{step},</if>
      <if test="status != null">status = #{status},</if>
      <if test="retCode != null">ret_code = #{retCode},</if>
      <if test="retMsg != null">ret_msg = #{retMsg},</if>
      <if test="distributePlan != null">distribute_plan = #{distributePlan},</if>
      <if test="txnDate != null">txn_date = #{txnDate},</if>
      <if test="txnNo != null">txn_no = #{txnNo},</if>
      <if test="uploadPath != null">upload_path = #{uploadPath},</if>
      <if test="outTradeDate != null">out_trade_date = #{outTradeDate},</if>
      <if test="outTradeNo != null">out_trade_no = #{outTradeNo},</if>
      updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号5
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/aibank-channel/blob/production/src/main/resources/mapper/AibankTasksMapper.xml](https://git.wolaidai.com/WelabCo/Finance/aibank-channel/blob/production/src/main/resources/mapper/AibankTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateState">
    update aibank_tasks
    set  state = #{state}, updated_at = now()
    where application_id = #{applicationId} and service_no = #{serviceNo}
  </update>
```

###### 编号6
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/AlipayRentNotifyMapper.xml](https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/AlipayRentNotifyMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateAlipayRentNotify" parameterType="com.wolaidai.alipayrentinginvestment.model.AlipayRentNotify">
    update alipay_rent_notify
    <set>
      <if test="status != null">
        status = #{status},
      </if>
      <if test="seqNo != null">
        seq_no = #{seqNo},
      </if>
      updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号7
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/AlipayTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/AlipayTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateAliPayTransactionStatus" parameterType="com.wolaidai.alipayrentinginvestment.model.AlipayTransactions">
        update alipay_transactions set
        <if test="status != null">
            status = #{status},
        </if>
        <if test="response != null">
            response = #{response},
        </if>
        <if test="request != null">
            request = #{request},
        </if>
        <if test="amount != null">
            amount = #{amount},
        </if>
        <if test="retCode != null">
            ret_code = #{retCode},
        </if>
        <if test="alipayFundOrderNo != null">
            alipay_fund_order_no = #{alipayFundOrderNo},
        </if>
        updated_at = now()
        where id = #{id}
    </update>
```

###### 编号8
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/AlipayTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/AlipayTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="changeAlipayTransactionStateJob" parameterType="com.wolaidai.alipayrentinginvestment.model.AlipayTransactions">
        update alipay_transactions set status = 'PAY_CHECKING',ret_code='9999' where status = 'PAY_INPROGRESS' and loan_type = 'long' and debit_source = 'withhold' and created_at &lt; (now() - interval '24 Hours')
    </update>
```

###### 编号9
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/AlipayTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/AlipayTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="shortResetTransactionStateJob">
        update alipay_transactions set status = 'PAY_FAILED',ret_code='9999' where status = 'PAY_INPROGRESS' and loan_type = 'short' and debit_source = 'withhold' and created_at &lt; (now() - interval '24 Hours')
    </update>
```

###### 编号10
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/ExtraFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/ExtraFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.alipayrentinginvestment.model.ExtraFees">
    insert into extra_fees (application_id, user_id,due_type, due_date, amount,
    settled_amount, outstanding_amount, created_at,updated_at)
    values (#{applicationId,jdbcType=VARCHAR}, #{userId,jdbcType=INTEGER},#{dueType,jdbcType=VARCHAR}, #{dueDate,jdbcType=DATE}, #{amount,jdbcType=NUMERIC},
      #{settledAmount,jdbcType=NUMERIC}, #{outstandingAmount,jdbcType=NUMERIC},now(),now())
  </insert>
```

###### 编号11
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/ExtraFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/ExtraFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.alipayrentinginvestment.model.ExtraFees">
    update extra_fees
    <set>
      <if test="dueDate != null">
        due_date = #{dueDate},
      </if>
      <if test="amount != null">
        amount = #{amount},
      </if>
      <if test="outstandingAmount != null">
        outstanding_amount = #{outstandingAmount},
      </if>
      updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号12
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/PrepaidTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/alipay-renting-investment/blob/production/src/main/resources/mapper/PrepaidTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePrepaidTransactions" parameterType="com.wolaidai.alipayrentinginvestment.model.PrepaidTransactions">
        update prepaid_transactions set
        <if test="status != null">
            status = #{status},
        </if>
        <if test="response != null">
            response = #{response},
        </if>
        <if test="retCode != null">
            ret_code = #{retCode},
        </if>
        <if test="retMsg != null">
            ret_msg = #{retMsg},
        </if>
        updated_at = now()
        where id = #{id}
    </update>
```

###### 编号13
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/allinpay-channel/blob/production/src/main/resources/mapper/AllinpayTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/allinpay-channel/blob/production/src/main/resources/mapper/AllinpayTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update">
    update allinpay_transactions
    set trans_state = #{upState,jdbcType=VARCHAR},
      ret_code = #{retCode,jdbcType=VARCHAR},
      ret_msg = #{retMsg,jdbcType=VARCHAR},
      updated_at = now()
    where id = #{id,jdbcType=INTEGER} and trans_state = #{orgiState,jdbcType=VARCHAR}
  </update>
```

###### 编号14
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/allinpay-channel/blob/production/src/main/resources/mapper/AllinpayTransInfoMapper.xml](https://git.wolaidai.com/WelabCo/Finance/allinpay-channel/blob/production/src/main/resources/mapper/AllinpayTransInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateByPaySeqNo">
        update allinpay_trans_info set state = #{state,jdbcType=VARCHAR},
        ret_code = #{retCode,jdbcType=VARCHAR},
        ret_msg = #{retMsg,jdbcType=VARCHAR},
        updated_at = now()
        where pay_seq_no = #{paySeqNo,jdbcType=VARCHAR}
    </update>
```

###### 编号15
**git地址**  
[https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/infrastructure/persistence/mapper/EcLoanOrdersDbMapper.xml](https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/infrastructure/persistence/mapper/EcLoanOrdersDbMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateJiequhuaPartnerLoanApplicationsFaild" parameterType="com.welab.loanapplication.domain.model.EcLoanOrdersEntity">
		update ec_loan_orders set state = #{state},updated_at = now()
		WHERE source = #{source}
		and user_id = #{userId}	
		and application_id is null 
		and state is null
	</update>
```

###### 编号16
**git地址**  
[https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/infrastructure/persistence/mapper/EcLoanOrdersDbMapper.xml](https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/infrastructure/persistence/mapper/EcLoanOrdersDbMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="cancelYesterdayPartnerLoanApplicationsBySource">
		update ec_loan_orders set state =#{state},updated_at =now()
		where source = #{source}
		and to_char(created_at, 'yyyy-MM-dd')=#{yesterday}
		and application_id is null
		and state is null
	</update>
```

###### 编号17
**git地址**  
[https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/mapper/CreditApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/mapper/CreditApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateUrgentApproval" parameterType="map">
                update credit_applications set urgent = #{urgent},updated_at = now() where application_id=#{applicationId}
    </update>
```

###### 编号18
**git地址**  
[https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/mapper/LoanApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/mapper/LoanApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateUrgentApproval" parameterType="map">
                update loan_applications set urgent = #{urgent},updated_at = now() where application_id=#{applicationId}
    </update>
```

###### 编号19
**git地址**  
[https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/mapper/UserVehicleInfoMapper.xml](https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/mapper/UserVehicleInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="saveUserVehicleInfo" useGeneratedKeys="true" keyProperty="id" parameterType="com.wolaidai.appcenter.model.UserVehicleInfo">
		INSERT INTO
		user_vehicle_info
		(user_id,plate_number, vehicle_type, use_nature, frame_no, engine_no, register_date, issue_date, owner, address, created_at, updated_at)
		VALUES
		(#{userId},#{plateNumber}, #{vehicleType}, #{useNature}, #{frameNo}, #{engineNo}, #{registerDate}, #{issueDate}, #{owner}, #{address}, now(), now())
	</insert>
```

###### 编号20
**git地址**  
[https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/mapper/UserVehicleInfoMapper.xml](https://git.wolaidai.com/welabco/tc/application-center/blob/production/src/main/resources/mapper/UserVehicleInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateUserVehicleInfo" parameterType="com.wolaidai.appcenter.model.UserVehicleInfo">
		UPDATE
		user_vehicle_info
		<set>
			<if test="plateNumber!=null and plateNumber!=''">
				plate_number = #{plateNumber},
			</if>
			<if test="vehicleType!=null and vehicleType!=''">
				vehicle_type = #{vehicleType},
			</if>
			<if test="useNature!=null and useNature!=''">
				use_nature = #{useNature},
			</if>
			<if test="frameNo!=null and frameNo!=''">
				frame_no = #{frameNo},
			</if>
			<if test="engineNo!=null and engineNo!=''">
				engine_no = #{engineNo},
			</if>
			<if test="registerDate!=null">
				register_date = #{registerDate},
			</if>
			<if test="issueDate!=null">
				issue_date = #{issueDate},
			</if>
			<if test="owner!=null and owner!=''">
				owner = #{owner},
			</if>
			<if test="address!=null and address!=''">
				address = #{address},
			</if>
			updated_at = now()
		</set>
		<where>
			id = #{id}
		</where>
	</update>
```

###### 编号21
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/AccountsSuMapper.xml](https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/AccountsSuMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertAccountsSu">
        insert into accounts_su(account_id, owner_id, owner_type, pay_code, balance, cash_balance,
        freeze_balance, withdraw_balance, created_at, updated_at)
        values(#{accountId},#{ownerId},#{ownerType},#{payCode}, 0.00, 0.00, 0.00, 0.00, now(),
        now())
    </insert>
```

###### 编号22
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.baofuchannel.model.BaofuBankCards">
    insert into baofu_bank_cards(seq_no,out_trade_no,user_id,application_id,unique_code,step,status,ret_code,ret_msg,created_at,updated_at)
    values(#{seqNo},#{outTradeNo},#{userId},#{applicationId},#{uniqueCode},#{step},#{status},#{retCode},#{retMsg},now(),now())
  </insert>
```

###### 编号23
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.baofuchannel.model.BaofuBankCards">
    update baofu_bank_cards
    <set>
      <if test="outTradeNo != null">
        out_trade_no = #{outTradeNo},
      </if>
      <if test="status != null">
        status = #{status},
      </if>
      <if test="step != null">
        step = #{step},
      </if>
      <if test="retCode != null">
        ret_code = #{retCode},
      </if>
      <if test="retMsg != null">
        ret_msg = #{retMsg},
      </if>
      <if test="protocolNo != null">
        protocol_no = #{protocolNo},
      </if>
      updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号24
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuTransactionMapper.xml](https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuTransactionMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.baofuchannel.model.BaofuTransaction">
    insert into baofu_transaction(seq_no,service_no,user_id,application_id,acc_name,cnid,bank_code,acc_no,mobile,branch,pay_type,protocol_no,ledger_list,out_trade_no,amount,fee,status,callback_status,ret_code,ret_msg,created_at,updated_at)
    values(#{seqNo},#{serviceNo},#{userId},#{applicationId},#{accName},#{cnid},#{bankCode},#{accNo},#{mobile},#{branch},#{payType},#{protocolNo},#{ledgerList},#{outTradeNo},#{amount},#{fee},#{status},#{callbackStatus},#{retCode},#{retMsg},now(),now())
  </insert>
```

###### 编号25
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuTransactionMapper.xml](https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuTransactionMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.baofuchannel.model.BaofuTransaction">
    update baofu_transaction
    <set>
      <if test="outTradeNo != null">
        out_trade_no = #{outTradeNo},
      </if>
      <if test="status != null">
        status = #{status},
      </if>
      <if test="callbackStatus != null">
        callback_status = #{callbackStatus},
      </if>
      <if test="retCode != null">
        ret_code = #{retCode},
      </if>
      <if test="retMsg != null">
        ret_msg = #{retMsg},
      </if>
      <if test="payType != null">
        pay_type = #{payType},
      </if>
      <if test="ledgerList != null">
        ledger_list = #{ledgerList},
      </if>
      <if test="protocolNo != null">
        protocol_no = #{protocolNo},
      </if>
      <if test="mobile != null">
        mobile = #{mobile},
      </if>
      <if test="accName != null">
        acc_name = #{accName},
      </if>
      <if test="cnid != null">
        cnid = #{cnid},
      </if>
      <if test="bankCode != null">
        bank_code = #{bankCode},
      </if>
      <if test="accNo != null">
        acc_no = #{accNo},
      </if>
      <if test="branch != null">
        branch = #{branch},
      </if>
      updated_at = now()
    </set>
    where seq_no = #{seqNo}
  </update>
```

###### 编号26
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuTransactionMapper.xml](https://git.wolaidai.com/WelabCo/Finance/baofu-channel/blob/production/src/main/resources/mapper/BaofuTransactionMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePayTransInfo">
        update pay_trans_info set state=#{state},end_time = now() where third_seq_no=#{seqNo} and pay_code = #{payCode}
    </update>
```

###### 编号27
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/bobcfc-investment/blob/production/bobcfc-investment-web/src/main/resources/mapper/ext/ExtBobcfcDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/bobcfc-investment/blob/production/bobcfc-investment-web/src/main/resources/mapper/ext/ExtBobcfcDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.bobcfc.model.BobcfcDues">
        insert into bobcfc_dues(application_id,index,due_date,principal,interest,service_fee,created_at,updated_at)
        values(#{applicationId},#{index},#{dueDate},#{principal},#{interest},#{serviceFee},now(),now())
    </insert>
```

###### 编号28
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/bobcfc-investment/blob/production/bobcfc-investment-web/src/main/resources/mapper/ext/ExtBobcfcDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/bobcfc-investment/blob/production/bobcfc-investment-web/src/main/resources/mapper/ext/ExtBobcfcDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert">
        insert into bobcfc_dues(application_id,index,due_date,principal,interest,service_fee,created_at,updated_at)
        values
        <foreach collection="list" item="item" index="index" separator=",">
            (#{item.applicationId},#{item.index},#{item.dueDate},#{item.principal},#{item.interest},#{item.serviceFee},now(),now())
        </foreach>
    </insert>
```

###### 编号29
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/bobcfc-investment/blob/production/bobcfc-investment-web/src/main/resources/mapper/RepayTransactionMapper.xml](https://git.wolaidai.com/WelabCo/Lender/bobcfc-investment/blob/production/bobcfc-investment-web/src/main/resources/mapper/RepayTransactionMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayTransactions" parameterType="com.wolaidai.bobcfc.model.RepayTransactions">
    update bobcfc_transactions
    set
    <if test="requestNo != null and requestNo != '' ">
      request_no = #{requestNo,jdbcType=VARCHAR},
    </if>
    <if test="status != null and status != '' ">
      status = #{status,jdbcType=VARCHAR},
    </if>
    <if test="retCode != null and retCode != '' ">
      ret_code = #{retCode,jdbcType=VARCHAR},
    </if>
    <if test="retMsg != null and retMsg != '' ">
      ret_msg = #{retMsg,jdbcType=VARCHAR},
    </if>
    <if test="request != null ">
      request = #{request,jdbcType=VARCHAR},
    </if>
     <if test="responseNo != null ">
      response_no = #{responseNo,jdbcType=VARCHAR},
    </if>
     <if test="response != null ">
      response = #{response,jdbcType=VARCHAR},
    </if>
    updated_at = now()
    where id = #{id,jdbcType=INTEGER}
  </update>
```

###### 编号30
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-channel/blob/production/src/main/resources/mapper/CtripOverdueMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-channel/blob/production/src/main/resources/mapper/CtripOverdueMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateOverDueByApplicationId">

    update ctrip_wangshang_overdue
    set status = #{status},
    updated_at = now()
    where application_id = #{applicationId} and status  = 'waiting'

    </update>
```

###### 编号31
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-channel/blob/production/src/main/resources/mapper/CtripWangshangTasksDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-channel/blob/production/src/main/resources/mapper/CtripWangshangTasksDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="upateTaskStatus" parameterType="com.welab.ctrip.channel.model.CtripWangshangTasksDetails">

		update ctrip_wangshang_tasks_details
		set
		<if test="null != state and state !=''">
		state = #{state},
		</if>
		<if test="null != retCode and retCode !=''">
			ret_code = #{retCode},
		</if>
		<if test="null != retMsg and retMsg !=''">
			ret_msg = #{retMsg},
		</if>
		updated_at =now()
		where application_id =#{applicationId} and step =#{step};


	</update>
```

###### 编号32
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-channel/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-channel/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanContractCode">
        update loan_procedures
        <set>
            <if test="contractCode != null">
                contract_code = #{contractCode},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号33
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-channel/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-channel/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateNextDate">
		UPDATE loan_attribute
		SET next_reimbursement_date=#{nextDate},next_repayment_date=#{nextDate},updated_at=now()
		WHERE application_id=#{applicationId}
	</update>
```

###### 编号34
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/CtripOverdueMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/CtripOverdueMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateOverDueByApplicationId">

    update ctrip_wangshang_overdue
    set status = #{status},
    updated_at = now()
    where application_id = #{applicationId} and status  = 'waiting'

    </update>
```

###### 编号35
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/CtripWangshangTasksDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/CtripWangshangTasksDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="upateTaskStatus" parameterType="com.welab.ctrip.wangshang.model.CtripWangshangTasksDetails">

		update ctrip_wangshang_tasks_details
		set
		<if test="null != state and state !=''">
		state = #{state},
		</if>
		<if test="null != retCode and retCode !=''">
			ret_code = #{retCode},
		</if>
		<if test="null != retMsg and retMsg !=''">
			ret_msg = #{retMsg},
		</if>
		updated_at =now()
		where application_id =#{applicationId} and step =#{step};


	</update>
```

###### 编号36
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/CtripWangshangTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/CtripWangshangTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="upateTaskStatus">
        update ctrip_wangshang_tasks
        set
        state = #{state},
        <if test="null != disbursedAt">
            disbursed_at = #{disbursedAt},
        </if>
        updated_at = now()
        where application_id =#{applicationId}


    </update>
```

###### 编号37
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/CtripWangshangTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/CtripWangshangTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateOrderNo">
        update ctrip_wangshang_tasks
        set
        order_no = #{orderNo},
        updated_at = now()
        where application_id =#{applicationId}

    </update>
```

###### 编号38
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanContractCode">
        update loan_procedures
        <set>
            <if test="contractCode != null">
                contract_code = #{contractCode},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号39
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/ctrip-wangshang-investment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateNextDate">
		UPDATE loan_attribute
		SET next_reimbursement_date=#{nextDate},next_repayment_date=#{nextDate},updated_at=now()
		WHERE application_id=#{applicationId}
	</update>
```

###### 编号40
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcCompensationRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcCompensationRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.cycfc.model.CycfcCompensationRecord">
        insert into cycfc_compensation_record
        (application_id,order_no,compen_at,INDEX,compensate_amount,return_amount,repay_model,STATUS,created_at,updated_at)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.applicationId},
            #{record.orderNo},
            #{record.compenAt},
            #{record.index},
            #{record.compensateAmount},
            #{record.returnAmount},
            #{record.repayModel},
            #{record.status},
            now(),
            now()
            )
        </foreach>
    </insert>
```

###### 编号41
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcReconciliationFileMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcReconciliationFileMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.cycfc.model.CycfcReconciliationFile">
        insert into cycfc_reconciliation_file
        (application_id,order_no,borrowing_number,user_name,total_amount,loan_balance,total_index,settle_index,due_date,deduction_amount,return_principal,return_interest,return_penalty_interest,return_compound_interest,return_cost,repay_model,is_compensation,actual_deduction_date,is_changyin_deduction,created_at,updated_at)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.applicationId},
            #{record.orderNo},
            #{record.borrowingNumber},
            #{record.userName},
            #{record.totalAmount},
            #{record.loanBalance},
            #{record.totalIndex},
            #{record.settleIndex},
            #{record.dueDate},
            #{record.deductionAmount},
            #{record.returnPrincipal},
            #{record.returnInterest},
            #{record.returnPenaltyInterest},
            #{record.returnCompoundInterest},
            #{record.returnCost},
            #{record.repayModel},
            #{record.isCompensation},
            #{record.actualDeductionDate},
            #{record.isChangyinDeduction},
            now(),
            now()
            )
        </foreach>
    </insert>
```

###### 编号42
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertTransactions" parameterType="com.wolaidai.cycfc.model.CycfcTransactions">
        INSERT INTO cycfc_transactions(out_repayment_seq,application_id, order_no,service_no,status, settle_index, amount,debit_source, repay_model,request,response,user_id,created_at, updated_at)
        VALUES (
          #{record.outRepaymentSeq},
          #{record.applicationId},
          #{record.orderNo},
          #{record.serviceNo},
          #{record.status},
          #{record.settleIndex},
          #{record.amount},
          #{record.debitSource},
          #{record.repayModel},
          #{record.request},
          #{record.response},
          #{record.userId},
          NOW(),
          NOW()
        )
    </insert>
```

###### 编号43
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateCycfcTransactions">
        update cycfc_transactions
        <set>
            <if test="outRepaymentSeq != null">
                out_repayment_seq = #{outRepaymentSeq},
            </if>
            <if test="applicationId != null">
                application_id = #{applicationId},
            </if>
            <if test="orderNo != null">
                order_no = #{orderNo},
            </if>
            <if test="serviceNo != null">
                service_no = #{serviceNo},
            </if>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="settleIndex != null">
                settle_index = #{settleIndex},
            </if>
            <if test="amount != null">
                amount = #{amount},
            </if>
            <if test="debitSource != null">
                debit_source = #{debitSource},
            </if>
            <if test="repayModel != null">
                repay_model = #{repayModel},
            </if>
            <if test="request != null">
                request = #{request},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            <if test="userId != null">
                user_id = #{userId},
            </if>
            <if test="createdAt != null">
                created_at = #{createdAt},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号44
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/CycfcTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.cycfc.model.CycfcTransactions">
        INSERT INTO
        cycfc_transactions(out_repayment_seq,application_id, order_no,service_no,status, settle_index,
        amount,debit_source,
        repay_model,request,response,user_id,created_at, updated_at)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.outRepaymentSeq},
            #{record.applicationId},
            #{record.orderNo},
            #{record.serviceNo},
            #{record.status},
            #{record.settleIndex},
            #{record.amount},
            #{record.debitSource},
            #{record.repayModel},
            #{record.request},
            #{record.response},
            #{record.userId},
            NOW(),
            NOW()
            )
        </foreach>
    </insert>
```

###### 编号45
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.cycfc.model.LoanTaskDetails">
        insert into cycfc_task_details (
          order_no,application_id, step, type, description,
          status, created_at, updated_at
        ) values (
          #{orderNo,jdbcType=VARCHAR},
          #{applicationId,jdbcType=VARCHAR},
          #{step,jdbcType=INTEGER}, #{type,jdbcType=VARCHAR},
          #{description,jdbcType=VARCHAR}, #{status,jdbcType=VARCHAR},
          now(), now()
        )
  </insert>
```

###### 编号46
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatusByStepAndApplicationId" parameterType="com.wolaidai.cycfc.model.LoanTaskDetails">
        update cycfc_task_details
        <set>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="request != null">
                request = #{request},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId} and step = #{step}
    </update>
```

###### 编号47
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.cycfc.model.LoanTasks">
        insert into cycfc_tasks (order_no,application_id,user_id, status,created_at, updated_at,disbursed_at) values (
          #{orderNo,jdbcType=VARCHAR},
          #{applicationId,jdbcType=VARCHAR},
          #{userId,jdbcType=INTEGER},
          #{status,jdbcType=VARCHAR},
          now(),
          now(),
          #{disbursedAt,jdbcType=TIMESTAMP}
        )
  </insert>
```

###### 编号48
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatusAndDisbursedAt">
        update cycfc_tasks
        <set>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="disbursedAt != null">
                disbursed_at =#{disbursedAt},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号49
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/CycfcCompensationRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/CycfcCompensationRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.cycfc1.model.CycfcCompensationRecord">
    insert into cycfc1_compensation_record
    (application_id,order_no,compen_at,INDEX,compensate_amount,return_amount,repay_model,STATUS,created_at,updated_at)
    values
    <foreach collection="list" item="record" index="index" separator=",">
      (
      #{record.applicationId},
      #{record.orderNo},
      #{record.compenAt},
      #{record.index},
      #{record.compensateAmount},
      #{record.returnAmount},
      #{record.repayModel},
      #{record.status},
      now(),
      now()
      )
    </foreach>
  </insert>
```

###### 编号50
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.cycfc1.model.LoanTaskDetails">
        insert into cycfc1_task_details (
          order_no,application_id, step, type, description,
          status, created_at, updated_at
        ) values (
          #{orderNo,jdbcType=VARCHAR},
          #{applicationId,jdbcType=VARCHAR},
          #{step,jdbcType=INTEGER}, #{type,jdbcType=VARCHAR},
          #{description,jdbcType=VARCHAR}, #{status,jdbcType=VARCHAR},
          now(), now()
        )
  </insert>
```

###### 编号51
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatusByStepAndApplicationId" parameterType="com.wolaidai.cycfc1.model.LoanTaskDetails">
        update cycfc1_task_details
        <set>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="request != null">
                request = #{request},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId} and step = #{step}
    </update>
```

###### 编号52
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.cycfc1.model.LoanTasks">
        insert into cycfc1_tasks (order_no,application_id,user_id, status,created_at, updated_at,disbursed_at) values (
          #{orderNo,jdbcType=VARCHAR},
          #{applicationId,jdbcType=VARCHAR},
          #{userId,jdbcType=INTEGER},
          #{status,jdbcType=VARCHAR},
          now(),
          now(),
          #{disbursedAt,jdbcType=TIMESTAMP}
        )
  </insert>
```

###### 编号53
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/cycfc1-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatusAndDisbursedAt">
        update cycfc1_tasks
        <set>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="disbursedAt != null">
                disbursed_at =#{disbursedAt},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号54
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/BankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/BankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="changeCardsInfo">

    update bank_cards set account_number=#{cardNo},bank_id=#{bankId},
    e_account_number=#{cardNo},updated_at=now()
    where user_id = #{userId} and pay_code='0014' and state='pass' and deleted_at is null

  </update>
```

###### 编号55
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/FeideeBankCardMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/FeideeBankCardMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateBankCardByUserId" parameterType="com.wolaidai.feidee.model.FeideeBankCard">
    update feidee_bank_cards
    set card_no = #{cardNo,jdbcType=VARCHAR},
        bank_code = #{bankCode},
      status = #{status,jdbcType=VARCHAR},
      updated_at = now(),
      mobile = #{mobile,jdbcType=VARCHAR}
    where user_id = #{userId}
  </update>
```

###### 编号56
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/FeideePrepaysMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/FeideePrepaysMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert">
		INSERT INTO feidee_prepays(application_id,principal,interest,loan_date,pay_date,created_at,updated_at,amount,is_sended,batch_no,index)
		VALUES(#{applicationId},#{principal},#{interest},#{loanDate},#{payDate},now(),now(),#{amount},#{isSended},#{batchNo},#{index})
	</insert>
```

###### 编号57
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/FeideePrepaysMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/FeideePrepaysMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert">
		INSERT INTO feidee_prepays(application_id,principal,interest,loan_date,pay_date,created_at,updated_at,amount,is_sended,batch_no,index)
		values
		<foreach collection="list" item="item" index="index" separator=",">
			(#{item.applicationId},#{item.principal},#{item.interest},#{item.loanDate},#{item.payDate},now(),now(),#{item.amount},#{item.isSended},#{item.batchNo},#{item.index})
		</foreach>
	</insert>
```

###### 编号58
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/FeideeTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/FeideeTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePayTransInfo">
        update pay_trans_info set state=#{state} ,end_time =now() where third_seq_no=#{seqNo}
    </update>
```

###### 编号59
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanTask" parameterType="com.wolaidai.feidee.model.LoanTasks">
		insert into feidee_tasks(order_no,application_id,user_id,state,curr_step,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{userId},#{state},#{currStep},now(),now())
	</insert>
```

###### 编号60
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanTaskDetail" parameterType="com.wolaidai.feidee.model.LoanTaskDetails">
		insert into feidee_task_details(order_no,application_id,state,step,type,description,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{state},#{step},#{type},#{description},now(),now())
	</insert>
```

###### 编号61
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/PayBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/PayBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="changeCardsInfo">
    update pay_bank_cards
    set card_no = #{cardNo}, e_card_no = #{cardNo}, bank_id = #{bankId}, bank_code = #{bankCode},update_time=now()
    where id = #{id}
  </update>
```

###### 编号62
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/RepayTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/RepayTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayTaskState">
        update feidee_repay_task_details set notify_state = #{state}, return_code = #{returnCode}, return_msg = #{returnMsg}, updated_at = now()
        where repay_type = #{repayType} and id in
        <foreach collection="detailIds" item="id" separator="," open="(" close=")">
            #{id}
        </foreach>
    </update>
```

###### 编号63
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/UserRepaysMapper.xml](https://git.wolaidai.com/WelabCo/Lender/feidee-investment/blob/production/src/main/resources/mapper/UserRepaysMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateSyncStatus">
		UPDATE USER_REPAYS SET
		SYNC_STATUS = #{syncStatus} ,updated_at = now()
		WHERE ID= #{id} and SYNC_STATUS = #{oldSyncStatus}
	</update>
```

###### 编号64
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="increaseAccountsAmount">
		update accounts set ${balanceType} = ${balanceType} + #{amount},updated_at=now() where id = #{accountId}
	</update>
```

###### 编号65
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="increaseAccountsSuAmount">
		update accounts_su set ${balanceType} = ${balanceType} + #{amount},updated_at=now() where id = #{accountSuId}
	</update>
```

###### 编号66
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="decreaseAccountsAmount">
		update accounts set ${balanceType} = ${balanceType} - #{amount},updated_at=now() where id = #{accountId}
	</update>
```

###### 编号67
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="decreaseAccountsSuAmount">
		update accounts_su set ${balanceType} = ${balanceType} - #{amount},updated_at=now() where id = #{accountSuId}
	</update>
```

###### 编号68
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="accountsFreeze">
		update accounts
		  set cash_balance = cash_balance - #{amount},freeze_balance = freeze_balance + #{amount}
		      , updated_at=now()
		where id = #{id}
	</update>
```

###### 编号69
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="accountsSuFreeze">
		update accounts_su
		  set cash_balance = cash_balance - #{amount},freeze_balance = freeze_balance + #{amount}
		      , updated_at=now()
		where id = #{id}
	</update>
```

###### 编号70
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="accountsUnFreeze">
		update accounts
		  set cash_balance = cash_balance + #{amount},freeze_balance = freeze_balance - #{amount}
		      , updated_at=now()
		where id = #{id}
	</update>
```

###### 编号71
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-account/blob/production/finance-account-core/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="accountsSuUnFreeze">
		update accounts_su
		  set cash_balance = cash_balance + #{amount},freeze_balance = freeze_balance - #{amount}
		      , updated_at=now()
		where id = #{id}
	</update>
```

###### 编号72
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationDataMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationDataMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertSelective" parameterType="com.welab.finance.reconciliation.model.ReconciliationData">
        insert into reconciliation_data (partner_code,origin,seq_no,request,created_at,updated_at)
        values (#{partnerCode,jdbcType=VARCHAR},#{origin,jdbcType=VARCHAR},#{seqNo,jdbcType=VARCHAR},#{request,jdbcType=VARCHAR},now(),now())
    </insert>
```

###### 编号73
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationDataMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationDataMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertByBatch" parameterType="java.util.List">
        insert into reconciliation_data (partner_code,origin,seq_no,request,created_at,updated_at)
        values
        <foreach collection="list" item="item" index="index" separator=",">
            (#{item.partnerCode,jdbcType=VARCHAR},#{item.origin,jdbcType=VARCHAR},#{item.seqNo,jdbcType=VARCHAR},#{item.request,jdbcType=VARCHAR},now(),now())
        </foreach>
    </insert>
```

###### 编号74
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationRecordMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertSelective" parameterType="com.welab.finance.reconciliation.model.ReconciliationRecord">
        insert into reconciliation_record (partner_code,type,source_file_url,compare_file_url,deal_date,status,created_at,updated_at) values (
        #{partnerCode,jdbcType=VARCHAR},#{type,jdbcType=VARCHAR},#{sourceFileUrl,jdbcType=VARCHAR},#{compareFileUrl,jdbcType=VARCHAR},#{dealDate,jdbcType=DATE},#{status,jdbcType=VARCHAR},now(),now())
    </insert>
```

###### 编号75
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationRecordMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateByPrimaryKeySelective" parameterType="com.welab.finance.reconciliation.model.ReconciliationRecord">
        update reconciliation_record
        <set>
            <if test="status != null">
                status = #{status,jdbcType=VARCHAR},
            </if>
            updated_at = now()
        </set>
        where id = #{id,jdbcType=INTEGER}
    </update>
```

###### 编号76
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationResultMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationResultMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertSelective" parameterType="com.welab.finance.reconciliation.model.ReconciliationResult">
        insert into reconciliation_result (record_id,code,message,created_at,updated_at) values (
        #{recordId,jdbcType=INTEGER},#{code,jdbcType=VARCHAR},#{message,jdbcType=VARCHAR},now(),now())
    </insert>
```

###### 编号77
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationResultMapper.xml](https://git.wolaidai.com/WelabCo/Finance/finance-reconciliation/blob/production/finance-reconciliation-core/src/main/resources/mapper/ReconciliationResultMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertByBatch" parameterType="java.util.List">
        insert into reconciliation_result (record_id,code,message,created_at,updated_at)
        values
        <foreach collection="list" item="item" index="index" separator=",">
            (#{item.recordId,jdbcType=INTEGER},#{item.code,jdbcType=VARCHAR},#{item.message,jdbcType=VARCHAR},now(),now())
        </foreach>
    </insert>
```

###### 编号78
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/foxconn-investment/blob/production/src/main/resources/mapper/DuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/foxconn-investment/blob/production/src/main/resources/mapper/DuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getOverdueByApplicationId" resultType="com.wolaidai.foxconninvestment.model.Dues">
	  select sum(COALESCE(d.amount,0)-COALESCE(d.settled_amount,0)) as principal,
	  (select sum(COALESCE(amount,0)-COALESCE(settled_amount,0))
	     from dues where loan_id=d.loan_id and due_type='interest'
	     <![CDATA[
	     and due_date<to_date(#{dueDate},'yyyy-MM-dd')
	     ]]>
	     GROUP BY loan_id
	   ) as interest,
	  (select sum(COALESCE(amount,0)-COALESCE(settled_amount,0))
	     from dues where loan_id=d.loan_id and due_type='management_fee'
	     <![CDATA[
	     and due_date<to_date(#{dueDate},'yyyy-MM-dd')
	     ]]>
	     GROUP BY loan_id
	  ) as management_fee,
	  (select COALESCE(amount,0)-COALESCE(settled_amount,0)
	    from dues where loan_id=d.loan_id and due_type='handling_fee'
	  ) as handling_fee,
	  min(d.due_date) as due_date,
	  max(date_part('day',now()::timestamp-d.due_date::timestamp)) as overdueDay
	  from dues d INNER JOIN loans l on d.loan_id=l.id
	  where l.state='disbursed' and l.application_id=#{applicationId} and d.due_type='principal'
      <![CDATA[
      and d.amount<>d.settled_amount
	  and d.due_date<to_date(#{dueDate},'yyyy-MM-dd')
	  ]]>
	  GROUP BY d.loan_id
  </select>
```

###### 编号79
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/foxconn-investment/blob/production/src/main/resources/mapper/FoxconnDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/foxconn-investment/blob/production/src/main/resources/mapper/FoxconnDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateFoxconnDues" parameterType="com.wolaidai.foxconninvestment.model.FoxconnDues">
		update FOXCONN_DUES
		set
		<if test="response != null and response != '' ">
			response = #{response,jdbcType=VARCHAR},
		</if>
		updated_at = now()
		where id = #{id,jdbcType=INTEGER}
	</update>
```

###### 编号80
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/foxconn-investment/blob/production/src/main/resources/mapper/FoxconnTaskDetailMapper.xml](https://git.wolaidai.com/WelabCo/Lender/foxconn-investment/blob/production/src/main/resources/mapper/FoxconnTaskDetailMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.foxconninvestment.model.FoxconnTaskDetail">
    <selectKey keyProperty="id" order="AFTER" resultType="java.lang.Integer">
      select nextval('foxconn_documents_id_seq')
    </selectKey>
    insert into foxconn_task_details (task_id, order_no, application_id, 
      early_settle_fee, due_index, settle_amount, 
      payobject, paytype, paydate, 
      payprincipalamt, payinterestamt, paymentfeeamt, 
      paymentapprovefeeamt, overday, created_at, 
      updated_at, curr_due_index, risk_amt, 
      risk_principal_amt, risk_interest_amt, payfee
      )
    values (#{taskId,jdbcType=INTEGER}, #{orderNo,jdbcType=VARCHAR}, #{applicationId,jdbcType=VARCHAR}, 
      #{earlySettleFee,jdbcType=NUMERIC}, #{dueIndex,jdbcType=VARCHAR}, #{settleAmount,jdbcType=NUMERIC}, 
      #{payobject,jdbcType=VARCHAR}, #{paytype,jdbcType=VARCHAR}, #{paydate,jdbcType=TIMESTAMP}, 
      #{payprincipalamt,jdbcType=NUMERIC}, #{payinterestamt,jdbcType=NUMERIC}, #{paymentfeeamt,jdbcType=NUMERIC}, 
      #{paymentapprovefeeamt,jdbcType=NUMERIC}, #{overday,jdbcType=VARCHAR}, now(),now(),
      #{currDueIndex,jdbcType=VARCHAR}, #{riskAmt,jdbcType=NUMERIC},
      #{riskPrincipalAmt,jdbcType=NUMERIC}, #{riskInterestAmt,jdbcType=NUMERIC}, #{payfee,jdbcType=NUMERIC}
      )
  </insert>
```

###### 编号81
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/foxconn-investment/blob/production/src/main/resources/mapper/UserRepaysMapper.xml](https://git.wolaidai.com/WelabCo/Lender/foxconn-investment/blob/production/src/main/resources/mapper/UserRepaysMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update">
        update user_repays set
        sync_status = #{syncStatus,jdbcType=VARCHAR},
        updated_at = now()
        where third_seq_no = #{seqNo,jdbcType=VARCHAR}
    </update>
```

###### 编号82
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserOverdueInfo" resultType="com.welab.agent.model.borrower.BaseAccountInfo">
		 select 
			    l.application_id as application_id,
			    l.disbursed_at as pay_loan_date,
			    l.amount as pay_loan_amount,
			    l.tenor as loan_tenor,
			    l.borrower_id as user_id,
			    l.id as loan_id
		 from loans l inner join dues d on l.id = d.loan_id 
		 where state = 'disbursed' and date(d.due_date) &lt; date(now()) and (d.amount - d.settled_amount) &gt; 0 and d.due_type = 'principal'
		 <if test="(accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != '') and     (accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != '') ">
		   and d.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
		   and d.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
		 </if>
		 group by l.id order by l.id
	</select>
```

###### 编号83
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getOverdueManageFeeAndLoanMangeFee" resultType="com.welab.agent.model.borrower.AccountDueInfo">
	<!--  
		select * from       
			(select 
			    case when sum(d.amount) is null then 0.00 else sum(d.amount) end as overdue_manage_fee
			from
		        dues d   where   d.index in 
						(select 
					    		d.index
				 	     from 
				 	     		loans l inner join dues d on l.id=d.loan_id 
						 where 
						        state ='disbursed' and date(d.due_date) &lt; date(now()) and (d.amount-d.settled_amount)&gt; 0 
						        and d.due_type='principal' and d.loan_id =#{loan_id}) 
			   and  d.due_type = 'management_fee'  and d.loan_id=#{loan_id})AA,
			(select 
			     sum(d.amount) as loan_manage_fee
			 from
		        dues d   where   d.due_type = 'management_fee'  and d.loan_id=#{loan_id})BB
		-->     
		  select 
		    sum(case when (date(d.due_date) &lt; date(now()) and (d.amount-d.settled_amount) &gt; 0 ) then d.amount else 0 end) as overdue_manage_fee, 
		    sum(COALESCE(d.amount,0.00)) as loan_manage_fee
		  from dues d 
		  where d.due_type = 'management_fee' and d.loan_id=#{loan_id}		 
	</select>
```

###### 编号84
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getCurrentOverduePeriodsAndOverdueDays" resultType="com.welab.agent.model.borrower.OverdueRepay">
<!-- 		select index ,date(now())-date(due_date) as current_overdue_day from dues d  -->
<!-- 		where (d.amount - d.settled_amount)&gt;0 and date(due_date) &lt; date(now()) and d.due_type ='principal' and d.loan_id = #{loan_id} order by due_date desc limit 1 -->
	 <!-- 	        兼容本金后还情况 -->  
	select index ,date(now())-date(due_date) as current_overdue_day from dues d 
		where (d.amount - d.settled_amount)&gt;0 and date(due_date) &lt; date(now())  and d.loan_id = #{loan_id} order by due_date desc limit 1
	</select>
```

###### 编号85
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getFirstOverduePeriodsAndOverdueDaysIncludeOverdueStartDate" resultType="com.welab.agent.model.borrower.OverdueRepay">
<!-- 		select index, date(now()) - date(due_date) as overdue_day_number, due_date + 1 as overdue_starting_day from dues d  -->
<!-- 		where (d.amount - d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.due_type ='principal' and d.loan_id = #{loan_id} order by index limit 1 -->
		 <!-- 	        兼容本金后还情况 -->  
		select index, date(now()) - date(due_date) as overdue_day_number, due_date + 1 as overdue_starting_day from dues d 
		where (d.amount - d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.loan_id = #{loan_id} order by d.index,d.due_date limit 1
	</select>
```

###### 编号86
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getResiduePeriods" resultType="Integer">
<!-- 		select count(1) from dues where  date(due_date) &gt; date(now()) and due_type ='principal' and loan_id = #{loan_id} -->
			   <!-- 	        兼容本金后还情况 -->
	select count(1) from (
	select index a from dues where date(due_date) &gt; date(now()) and loan_id =#{loan_id} group by index) T
	</select>
```

###### 编号87
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getOutAmountGroupByDueType" resultType="com.welab.agent.model.borrower.OverdueRepay">
		select due_type,sum(outstanding_amount) as sumAmount from dues where due_date &lt; date(now())  and loan_id = #{loan_id} group by due_type 
	</select>
```

###### 编号88
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getOverduePeriods" resultType="Integer">		
<!--     	select count(1)  -->
<!-- 		from dues d -->
<!-- 	 	where date(d.due_date) &lt; date(now()) and (d.amount - d.settled_amount)&gt;0 and due_type ='principal' and  d.loan_id=#{loan_id} -->
	 <!-- 	        兼容本金后还情况 --> 
	select count(1) from (
	select index a from dues d where date(d.due_date) &lt; date(now()) and (d.amount - d.settled_amount)&gt;0 and loan_id = #{loan_id} group by index) T
	 </select>
```

###### 编号89
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getOverduePeriodsTotalAmount" resultType="BigDecimal">
	<!--  
		select (should_amount - fact_amount) from 
			 (select 
			       case when sum(ds.amount) is null then 0.00 else sum(ds.amount) end as fact_amount 
			  from 
			        dues d inner join due_settlements ds on d.id = ds.due_id where   d.index in 
				         (select  
				               d.index 
				          from 
				               loans l inner join dues d on l.id=d.loan_id 
		 			      where 
		 			           state ='disbursed' and date(d.due_date) &lt; date(now()) and (d.amount-d.settled_amount)&gt; 0 
		 			           and d.due_type='principal' and d.loan_id =#{loan_id}) 
		 		    and  d.loan_id= #{loan_id})AA,
		    (select 
		    	  case when sum(d.amount) is null then 0.00 else sum(d.amount) end as should_amount 
		     from 
		     	  dues d   where   d.index in 
		     	         (select 
			   				   d.index
		 				  from 
		 				  	   loans l inner join dues d on l.id=d.loan_id 
		 				  where 
		 				       state ='disbursed' and date(d.due_date) &lt; date(now()) and (d.amount-d.settled_amount)&gt; 0 
		         and d.due_type='principal' and d.loan_id =#{loan_id}) and  d.loan_id= #{loan_id}
		 )BB
		 -->
		 select COALESCE(sum(COALESCE(d.amount,0.00)- COALESCE(ds.amount,0.00)),0.00) as fact_amount from dues d 
			left join (select due_id,sum(amount) as amount from due_settlements  
			           where due_id in (select id from dues where loan_id = #{loan_id} )
			              group by due_id
			           ) ds on d.id = ds.due_id
			left join loans l on  l.id=d.loan_id
			where d.loan_id= #{loan_id}  and  l.state ='disbursed' and date(d.due_date) &lt;= date(now()) and (d.amount-d.settled_amount) &gt; 0 
	</select>
```

###### 编号90
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getAccountInfo" resultType="com.welab.agent.model.AccoutInfoRslt">
		SELECT  l.application_id, l.tenor,u.mobile, u.id as rmtUserId, dt.index as currentIndex, dt.loan_id, dt.is_overdue,p.name,dt.due_date, dt.updated_at 
	    FROM users u 
	    LEFT JOIN  PROFILES p ON u.id = p.borrower_id 
	    LEFT JOIN loans l ON u.id = l.borrower_id
	    inner JOIN (
	        SELECT loan_id, MIN(index) AS index, MIN(due_date) AS due_date, MAX(updated_at) AS updated_at,
	         (CASE WHEN SUM(d.amount-d.settled_amount) &gt; 0 THEN 'Y' ELSE 'N' END)
	         AS is_overdue 
	        FROM dues d  
	        where date(d.due_date) &lt; date(now())
	      <!-- 	        兼容本金后还情况 -->  
<!-- 	        and d.due_type = 'principal' -->
	         <if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">  
	            and d.loan_id  = #{accountInfoPrm.loan_id }  
	        </if> 
	        <if test="accountInfoPrm.index != null">  
	            and d.index = #{accountInfoPrm.index}  
	        </if> 
	         <if test="accountInfoPrm.beginDuedate != null and accountInfoPrm.beginDuedate != ''">
			   and d.due_date &gt;= to_date(#{accountInfoPrm.beginDuedate},'YYYY-MM-DD')
			</if> 
			<if test="accountInfoPrm.endDuedate != null and accountInfoPrm.endDuedate != ''">		  
			   and d.due_date &lt;= to_date(#{accountInfoPrm.endDuedate},'YYYY-MM-DD')
			</if> 
			<if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
			   and d.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
			   and d.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if>
	        GROUP BY loan_id
	              ) dt ON l.id = dt.loan_id
	    <trim prefix="where" prefixOverrides="and |or"> 
	        <if test="accountInfoPrm.application_id != null and accountInfoPrm.application_id != ''">  
	           and l.application_id = #{accountInfoPrm.application_id} 
	        </if>        
	        <if test="accountInfoPrm.mobile != null and accountInfoPrm.mobile != ''">  
	            and u.mobile = #{accountInfoPrm.mobile }  
	        </if>  
	        <if test="accountInfoPrm.name != null and accountInfoPrm.name != ''">  
	            and p.name  = #{accountInfoPrm.name }  
	        </if> 
			<if test="accountInfoPrm.is_overdue != null and accountInfoPrm.is_overdue != ''">  
	            and dt.is_overdue  = #{accountInfoPrm.is_overdue }  
	        </if>
			<choose><when test="accountInfoPrm.is_overdue ==&quot;Y&quot;">
					and l.state = 'disbursed'
			        and dt.is_overdue = 'Y'
				</when><when test="accountInfoPrm.is_overdue ==&quot;N&quot;">
					and dt.is_overdue = 'N'
				</when><otherwise>
				</otherwise></choose>	
	     </trim>
	   ORDER BY l.application_id,l.tenor,u.mobile 
	</select>
```

###### 编号91
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueAccountInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getOverDueList" resultType="com.welab.agent.model.AccoutInfoRslt">
	 SELECT d.loan_id, d.application_id,d.user_id as rmtUserId,MIN(d.index) as currentIndex, MIN(d.due_date) AS due_date, MAX(d.updated_at) AS updated_at
	        FROM dues d  
	        where date(d.due_date) &lt; date(now())
	      <!-- 	        兼容本金后还情况 -->  
                and d.due_type in ('principal','guarantee_fee')
	            and d.amount-d.settled_amount  &gt; 0  
	         <if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">  
	            and d.loan_id  = #{accountInfoPrm.loan_id }  
	        </if> 
	        <if test="accountInfoPrm.index != null">  
	            and d.index = #{accountInfoPrm.index}  
	        </if> 
	        <if test="accountInfoPrm.application_id != null and accountInfoPrm.application_id != ''">  
	           and d.application_id = #{accountInfoPrm.application_id} 
	        </if>        
	         <if test="accountInfoPrm.beginDuedate != null and accountInfoPrm.beginDuedate != ''">
			   and d.due_date &gt;= to_date(#{accountInfoPrm.beginDuedate},'YYYY-MM-DD')
			</if> 
			<if test="accountInfoPrm.endDuedate != null and accountInfoPrm.endDuedate != ''">		  
			   and d.due_date &lt;= to_date(#{accountInfoPrm.endDuedate},'YYYY-MM-DD')
			</if> 
			<if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
			   and d.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
			   and d.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if>
	        GROUP BY d.loan_id,d.application_id,d.user_id
     </select>
```

###### 编号92
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserContactsAddressByAccountInfoPrm" resultType="com.welab.agent.model.borrower.UserProfileInfo">
      select 
            ad.province as province ,
            ad.city as city,
            ad.district as district,
            ad.street as street,
            ad.addressable_id as contacts_number,
            lst.ID as address_id,
            lst.ID as liaisons_id,
            ad.addressable_type as address_type,
            ea.province_name province_name,
            ea.city_name city_name,
            ea.district_name district_name,
            l.borrower_id as rmtUserId,
            ad.location as location
       from addresses ad
       left join  areas ea on  ea.province_code::int = ad.province and ea.city_code::int = ad.city and ea.district_code::int = ad.district
       inner join liaisons lst on lst.id = ad.addressable_id 
       inner join loans l on lst.user_id=l.borrower_id  
       left join dues d on d.loan_id = l.id
       where l.state ='disbursed' 
            <if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
               and ad.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
            </if> 
            <if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">       
               and ad.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
            </if> 
<!--         and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.due_type = 'principal'    -->
             and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now())
       ORDER BY l.borrower_id      
    </select>
```

###### 编号93
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserContactsInfoByAccountInfoPrm" resultType="com.welab.agent.model.borrower.UserProfileInfo">
       select 
           ls.user_id as rmtUserId,
           ls.relationship as relationship ,
           ls.name as contacts_name ,
           ls.mobile as contacts_mobile,
           ls.id as contacts_number,
		       ls.deleted_at as contacts_deleted_at
       from liaisons ls
       inner join loans l on ls.user_id = l.borrower_id
       LEFT JOIN dues d ON l.id = d.loan_id  
       where l.state ='disbursed'
         <if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
		   and ls.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
		 </if> 
		 <if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
		   and ls.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
		 </if>  
		 <if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">  
            and d.loan_id  = #{accountInfoPrm.loan_id }  
       	 </if> 
  		 <if test="accountInfoPrm.index != null">  
            and d.index = #{accountInfoPrm.index}  
         </if>      
<!--         and d.amount &gt; d.settled_amount and date(d.due_date) &lt; date(now()) and d.due_type = 'principal' -->
             and d.amount &gt; d.settled_amount and date(d.due_date) &lt; date(now()) 
             and d.due_type in ('principal','guarantee_fee')
	   ORDER BY ls.user_id
	</select>
```

###### 编号94
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserBasicInfoByAccountInfoPrm" resultType="com.welab.agent.model.borrower.UserInfo">
       select   distinct
                p.borrower_id as rmtUserId,
				u.mobile as user_mobile, 
				p.name as name ,
				u.role_type as role_type ,
				p.cnid as cnid,
				p.qq as email,
				p.marriage as marriage,
			    p.id as profiles_id ,
			    p.gender as gender
	    from 
	    		profiles p  
	    left join users u on p.borrower_id = u.id     
	    inner join loans l on p.borrower_id = l.borrower_id
        left join dues d on l.id = d.loan_id    
        where l.state ='disbursed'
            <if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
			   and p.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
			   and p.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if>
			<if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">  
	            and d.loan_id  = #{accountInfoPrm.loan_id }  
	       	 </if> 
	  		 <if test="accountInfoPrm.index != null">  
	            and d.index = #{accountInfoPrm.index}  
	         </if> 
<!--          and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.due_type = 'principal' -->
               and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now())
	   ORDER BY p.borrower_id,u.mobile
	</select>
```

###### 编号95
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserAdrressInfoByAccountInfoPrm" resultType="com.welab.agent.model.borrower.UserProfileInfo">
	 select
	 	ad.province as province,
		ad.city as city,
		ad.district as district,
		ad.street as street,
		ad.addressable_id as contacts_number,
		ad.id as address_id,
		lst.ID as liaisons_id,
		ad.addressable_type as address_type,
		ea.province_name province_name,
        ea.city_name city_name,
        ea.district_name district_name,
        l.borrower_id as rmtUserId,
        ad.location as location   
     from addresses ad
       left join  areas ea on  ea.province_code::int = ad.province and ea.city_code::int = ad.city and ea.district_code::int = ad.district
       inner join liaisons lst on lst.id = ad.addressable_id 
       inner join loans l on lst.user_id=l.borrower_id  
       left join dues d on d.loan_id = l.id
       where l.state ='disbursed' 
			<if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
			   and ad.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
			   and ad.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
<!-- 		and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.due_type = 'principal'	 -->
            and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) 
	   ORDER BY l.borrower_id
	</select>
```

###### 编号96
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserBankCardInfoByAccountInfoPrm" resultType="com.welab.agent.model.borrower.UserInfo">
		select 
				bc.account_number as bank_no ,
				bc.id as bank_card_id,
			    b.name as bank_name,
			    b.id as bank_id,
			    bc.user_id rmtUserId
	    from 
	    	 bank_cards bc  
	    inner join banks b on  bc.bank_id = b.id
        left join users u on  bc.user_id = u.id
        inner join  (
    		select distinct(l.borrower_id) as borrower_id
    		  from dues d 
    		  left join loans l on l.id = d.loan_id      
    		where l.state ='disbursed' and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.due_type = 'principal'
    		<if test="accountInfoPrm.application_id != null and accountInfoPrm.application_id != ''">  
	          	and l.application_id = #{accountInfoPrm.application_id} 
	         </if>
	         <if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">  
            	and d.loan_id  = #{accountInfoPrm.loan_id }  
        	 </if> 
   			 <if test="accountInfoPrm.index != null">  
              and d.index = #{accountInfoPrm.index}  
             </if>
             <if test="accountInfoPrm.beginDuedate != null and accountInfoPrm.beginDuedate != ''">
			   and d.due_date &gt;= to_date(#{accountInfoPrm.beginDuedate},'YYYY-MM-DD')
			 </if> 
			 <if test="accountInfoPrm.endDuedate != null and accountInfoPrm.endDuedate != ''">		  
			   and d.due_date &lt;= to_date(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD')
			 </if>
          ) dss on dss.borrower_id = u.id 
        left join profiles p on p.borrower_id = u.id  
	   <trim prefix="where" prefixOverrides="and |or"> 
	        <if test="accountInfoPrm.mobile != null and accountInfoPrm.mobile != ''">  
	            and u.mobile = #{accountInfoPrm.mobile }  
	        </if>  
	        <if test="accountInfoPrm.name != null and accountInfoPrm.name != ''">  
	            and p.name  = #{accountInfoPrm.name }  
	        </if>
	       
			<if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
			   and bc.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
			   and bc.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
	    </trim>  
	   ORDER BY dss.borrower_id,u.mobile  
	</select>
```

###### 编号97
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserEducationInfoByAccountInfoPrm" resultType="com.welab.agent.model.borrower.UserProfileInfo">
	    select 
	    	es.degree_id as education_level, 
	    	es.school as school_name,
	    	es.id as educations_id,
	    	es.user_id as rmtUserId
		 from  educations es
         inner join loans l on es.user_id = l.borrower_id
         left join dues d on  l.id = d.loan_id 
        where l.state ='disbursed'
            <if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
			   and es.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
			   and es.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">  
                and d.loan_id  = #{accountInfoPrm.loan_id }  
        	</if> 
   			<if test="accountInfoPrm.index != null">  
                and d.index = #{accountInfoPrm.index}  
           </if>
<!--            and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.due_type = 'principal' -->
		   and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) 
	   ORDER BY es.user_id
	</select>
```

###### 编号98
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserCompanyInfoByAccountInfoPrm" resultType="com.welab.agent.model.borrower.UserProfileInfo">
		select 
			cs.name as company_name, 
			cs.position_id as position, 
			cs.entry_time as entry_time,
			cs.id as company_id,
			cs.user_id as rmtUserId
		from  
			companies cs 
		 inner join loans l on cs.user_id = l.borrower_id
         left join dues d on  l.id = d.loan_id 
        where l.state ='disbursed'
            <if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
			   and cs.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
			   and cs.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">  
                and d.loan_id  = #{accountInfoPrm.loan_id }  
        	</if> 
   			<if test="accountInfoPrm.index != null">  
                and d.index = #{accountInfoPrm.index}  
           </if>
<!-- 		   and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.due_type = 'principal' -->
               and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now())
	   ORDER BY cs.user_id
	</select>
```

###### 编号99
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueCustomInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getUserIndustryInfoByAccountInfoPrm" resultType="com.welab.agent.model.borrower.UserProfileInfo">
		select 
			ui.industry_code as industry_code, 
			ui.category_code as category_code,
			ui.id as industry_id,
			ui.user_id as rmtUserId
		from  user_industries ui 
         inner join loans l on ui.user_id = l.borrower_id
         left join dues d on  l.id = d.loan_id 
        where l.state ='disbursed'
            <if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
			   and ui.updated_at &gt;= to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">		  
			   and ui.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if> 
			<if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">  
                and d.loan_id  = #{accountInfoPrm.loan_id }  
        	</if> 
   			<if test="accountInfoPrm.index != null">  
                and d.index = #{accountInfoPrm.index}  
           </if>
<!-- 		   and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now()) and d.due_type = 'principal' -->
               and (d.amount-d.settled_amount) &gt; 0 and date(d.due_date) &lt; date(now())
	   ORDER BY ui.user_id
	</select>
```

###### 编号100
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueRepayInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueRepayInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getOverDueRepayFlow" resultType="com.welab.agent.model.borrower.OverdueRepay">
		select
			dss.fact_amount,
			dss.fact_date,
			dss.fact_update_date,
			dss.due_record_id,
			d.index as index,
			d.due_type as due_type,
			d.due_date as due_date,
			d.loan_id,
			d.id as due_id,
			d.amount as should_amount
		from
			dues d 
			left join (select COALESCE(sum(ds.amount),0.00) as fact_amount, min(created_at) as fact_date ,max(updated_at) as fact_update_date,max(ds.id) as due_record_id,due_id from due_settlements ds group by due_id) dss on d.id = dss.due_id
			left join loans l on l.id = d.loan_id
			left join users u on u.id = l.borrower_id
			left join profiles p on u.id = p.borrower_id
<!-- 		where date(d.due_date) &lt; date(now()) and d.due_type = 'principal' -->
            where date(d.due_date) &lt; date(now()) 
			<choose><when test="accountInfoPrm.is_overdue ==&quot;N&quot;">
					and (d.amount - d.settled_amount) = 0
				</when><otherwise>
					and (d.amount - d.settled_amount) &gt; 0
					and l.state = 'disbursed'
				</otherwise></choose>			
			<if test="accountInfoPrm.application_id != null and accountInfoPrm.application_id != ''">
				and l.application_id = #{accountInfoPrm.application_id}
			</if>
			<if test="accountInfoPrm.index != null and accountInfoPrm.index != ''">
				and d.index = #{accountInfoPrm.index}
			</if>
			<if test="accountInfoPrm.mobile != null and accountInfoPrm.mobile != ''">
				and u.mobile = #{accountInfoPrm.mobile }
			</if>
			<if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">
				and d.loan_id = #{accountInfoPrm.loan_id }
			</if>
			<if test="accountInfoPrm.name != null and accountInfoPrm.name != ''">
				and p.name = #{accountInfoPrm.name }
			</if>
			<if test="accountInfoPrm.beginDuedate != null and accountInfoPrm.beginDuedate != ''">
				and d.due_date &gt;= to_date(#{accountInfoPrm.beginDuedate},'YYYY-MM-DD')
			</if>
			<if test="accountInfoPrm.endDuedate != null and accountInfoPrm.endDuedate != ''">
				and d.due_date &lt;= to_date(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD')
			</if>
			<if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
				and dss.fact_update_date &gt; to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if>
			<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">
				and dss.fact_update_date &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
			</if>
			order by dss.fact_update_date
	</select>
```

###### 编号101
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueRepayInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueRepayInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getRepayFlowByAccountInfoPrm" resultType="com.welab.agent.model.borrower.OverdueRepay">
	select
			dss.fact_amount,
			dss.fact_date,
			dss.fact_update_date,
			dss.due_record_id,
			dss.index as index,
			dss.due_date as due_date,
			dss.loan_id,
			dss.due_id,
			dss.should_amount,
			l.state as loanState
		from
			(
				select COALESCE(sum(ds.amount),0.00) as fact_amount, min(ds.created_at) as fact_date ,max(ds.updated_at) as fact_update_date,
					max(ds.id) as due_record_id,max(due_id) as due_id,
					loan_id, index, max(d.due_date) as due_date, COALESCE(sum(d.amount),0.00) as should_amount
				from due_settlements ds 
					right join dues d on d.id = ds.due_id
	           	where date(d.due_date) &lt; date(now())
	           	<if test="accountInfoPrm.beginUpdateTime != null and accountInfoPrm.beginUpdateTime != ''">
					and ds.updated_at &gt; to_timestamp(#{accountInfoPrm.beginUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
				</if>
				<if test="accountInfoPrm.endUpdateTime != null and accountInfoPrm.endUpdateTime != ''">
					and ds.updated_at &lt;= to_timestamp(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD HH24:MI:SS.MS')
				</if>
				<if test="accountInfoPrm.index != null and accountInfoPrm.index != ''">
					and index = #{accountInfoPrm.index}
				</if>
				<if test="accountInfoPrm.loan_id != null and accountInfoPrm.loan_id != ''">
					and loan_id = #{accountInfoPrm.loan_id }
				</if>
	    		group by loan_id,index
			) dss
			left join loans l on l.id = dss.loan_id
			left join users u on u.id = l.borrower_id
			left join profiles p on u.id = p.borrower_id
		<trim prefix="where" prefixOverrides="and |or">
			<if test="accountInfoPrm.application_id != null and accountInfoPrm.application_id != ''">
				and l.application_id = #{accountInfoPrm.application_id}
			</if>
			<if test="accountInfoPrm.mobile != null and accountInfoPrm.mobile != ''">
				and u.mobile = #{accountInfoPrm.mobile }
			</if>
			
			<if test="accountInfoPrm.name != null and accountInfoPrm.name != ''">
				and p.name = #{accountInfoPrm.name }
			</if>
			<if test="accountInfoPrm.beginDuedate != null and accountInfoPrm.beginDuedate != ''">
				and dss.due_date &gt;= to_date(#{accountInfoPrm.beginDuedate},'YYYY-MM-DD')
			</if>
			<if test="accountInfoPrm.endDuedate != null and accountInfoPrm.endDuedate != ''">
				and dss.due_date &lt;= to_date(#{accountInfoPrm.endUpdateTime},'YYYY-MM-DD')
			</if>			
		</trim>
		order by dss.fact_update_date
	</select>
```

###### 编号102
**git地址**  
[https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueRepayInfoMapper.xml](https://git.wolaidai.com/WelabCo/Collection/gather-agent-refactor/blob/production/gather-agent-dao/src/main/resources/mapper/borrower/OverdueRepayInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getRepayFlowByMaxFlowId" resultType="com.welab.agent.model.borrower.OverdueRepay">
	select
			dss.fact_amount,
			dss.fact_date,
			dss.fact_update_date,
			dss.due_record_id,
			dss.index as index,
			dss.due_date as due_date,
			dss.loan_id,
			dss.due_id,
			dss.should_amount,
			l.state as loanState
		from
			(
				select COALESCE(sum(ds.amount),0.00) as fact_amount, min(ds.created_at) as fact_date ,max(ds.updated_at) as fact_update_date,
					max(ds.id) as due_record_id,max(due_id) as due_id,
					loan_id, index, max(d.due_date) as due_date, COALESCE(sum(d.amount),0.00) as should_amount
				from due_settlements ds 
					right join dues d on d.id = ds.due_id
	           	where date(d.due_date) &lt; date(now())
	                and ds.ID &gt; #{minFlowId}
	                <if test="maxFlowId != null ">
	                 and ds.ID &lt;= #{maxFlowId}
	                 </if>
	    		group by loan_id,index
	    		order by max(ds.id) 
			) dss
			left join loans l on l.id = dss.loan_id
	</select>
```

###### 编号103
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/haiercfc-investment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/haiercfc-investment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanContractCode">
        update loan_procedures
        <set>
            <if test="contractCode != null">
                contract_code = #{contractCode},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号104
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/haiermoney-investment/blob/production/src/main/resources/mapper/HaierMoneyCompensationRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/haiermoney-investment/blob/production/src/main/resources/mapper/HaierMoneyCompensationRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.welab.haiermoney.model.HaierMoneyCompensationRecord">
        insert into haiermoney_compensation_record
        (application_id, order_no, channel_no, principal, interest, service_fee, penalty_interest, haier_loan_no, index,
        compensate_amount, compen_at, repay_model, description, partner_code,created_at, updated_at)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.applicationId},
            #{record.orderNo},
            #{record.channelNo},
            #{record.principal},
            #{record.interest},
            #{record.serviceFee},
            #{record.penaltyInterest},
            #{record.haierLoanNo},
            #{record.index},
            #{record.compensateAmount},
            #{record.compenAt},
            #{record.repayModel},
            #{record.description},
            #{record.partnerCode},
            now(),
            now()
            )
        </foreach>
    </insert>
```

###### 编号105
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/haiermoney-investment/blob/production/src/main/resources/mapper/HaierMoneyRepurchaseRecordsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/haiermoney-investment/blob/production/src/main/resources/mapper/HaierMoneyRepurchaseRecordsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.welab.haiermoney.model.HaierMoneyRepurchaseRecords">
    insert into haiermoney_repurchase_records (application_id, channel_no,
    amount, repay_type, haier_order_no,repurchase_date, status,order_no, created_at,updated_at)
    values
    <foreach collection="list" item="record" index="index" separator=",">
      (
      #{record.applicationId},
      #{record.channelNo},
      #{record.amount},
      #{record.repayType},
      #{record.haierOrderNo},
      #{record.repurchaseDate},
      #{record.status},
      #{record.orderNo},
      now(),
      now()
      )
    </foreach>
  </insert>
```

###### 编号106
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/haiermoney-investment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/haiermoney-investment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanContractCode">
    update loan_procedures
    <set>
      <if test="contractCode != null">
        contract_code = #{contractCode},
      </if>
      updated_at = now()
    </set>
    where application_id = #{applicationId}
  </update>
```

###### 编号107
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/HexieTransactonsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/HexieTransactonsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.hexie.model.HexieTransactions">
        insert into hexie_transactions(application_id,service_no,partner_code,cert_no,bill_no,apply_no,is_compensatory,
        due_index,is_overdue,principal,interest,penalty,pay_date,status,created_at,updated_at)
         VALUES (#{applicationId},#{serviceNo},#{partnerCode},#{certNo},#{billNo},#{applyNo},#{isCompensatory},
         #{dueIndex},#{isOverdue},#{principal},#{interest},#{penalty},#{payDate},#{status},now(),now())
    </insert>
```

###### 编号108
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/HexieTransactonsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/HexieTransactonsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateByPayDate">
        update hexie_transactions set status = #{status},
        updated_at = now()
        where partner_code = #{partnerCode}
        and pay_date = #{payDate}
        and status = 'none'
        AND is_compensatory = #{isCompensatory}
    </update>
```

###### 编号109
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertDetails" parameterType="com.wolaidai.hexie.model.UnderwriteTaskDetails">
		insert into hexie_enhance_task_details(partner_code,application_id,apply_no,disbursed_at,step,type,description,state,request,txt_content,created_at,updated_at)
		values(#{partnerCode},#{applicationId},#{applyNo},#{disbursedAt},#{step},#{type},#{description},#{state},#{request},#{txtContent},now(),now())
	</insert>
```

###### 编号110
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDetails" parameterType="com.wolaidai.hexie.model.UnderwriteTaskDetails">
        update hexie_enhance_task_details
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号111
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateByDisbursedAt">
        update hexie_enhance_task_details set state = #{state},
            updated_at = now()
        where step = #{step}
        and partner_code = #{partnerCode}
        AND state = 'none'
        <![CDATA[and disbursed_at>= #{beginDate} and disbursed_at < #{endDate}]]>
    </update>
```

###### 编号112
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.hexie.model.UnderwriteTasks">
        insert into hexie_enhance_tasks(partner_code,user_id,application_id,apply_no,disbursed_at,state,is_policy_loaded,created_at,updated_at)
        values(#{partnerCode},#{userId},#{applicationId},#{applyNo},#{disbursedAt},#{state},0,now(),now())
	</insert>
```

###### 编号113
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/hexie-guarantee/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateUnderwriteTasks" parameterType="com.wolaidai.hexie.model.UnderwriteTasks">
        update hexie_enhance_tasks
        <set>
            <if test="policyNo != null">
                policy_no = #{policyNo},
            </if>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="isPolicyLoaded != null">
                is_policy_loaded = #{isPolicyLoaded},
            </if>
            <if test="description != null">
                description = #{description},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号114
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/hubeicfc-investment/blob/production/src/main/resources/mapper/HubeicfcTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/hubeicfc-investment/blob/production/src/main/resources/mapper/HubeicfcTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateIds">
    update hubeicfc_transactions
    set status = #{status}, updated_at = now()
    where id in
    <foreach item="id" collection="list" open="(" separator="," close=")">
      #{id}
    </foreach>
  </update>
```

###### 编号115
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/ChargeDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/ChargeDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateChargeDues" parameterType="com.wolaidai.jimu.model.ChargeDues">
    update charge_dues set amount = #{amount},outstanding_amount=#{outstandingAmount},updated_at = now() where id = #{id}
    </update>
```

###### 编号116
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/DuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/DuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDues" parameterType="com.wolaidai.jimu.model.Dues">
	update dues set amount = #{amount},outstanding_amount=#{outstandingAmount},updated_at = now() where id = #{id}
	</update>
```

###### 编号117
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuCompensationRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuCompensationRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchSave" parameterType="com.wolaidai.jimu.model.JimuCompensationRecord">
          INSERT INTO jimu_compensation_record(application_id,project_id,user_id,disbursed_at,index,total_index,principle,interest,compensate_amount,compen_at,created_at,updated_at)
        VALUES
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.applicationId},
            #{record.projectId},
            #{record.userId},
            #{record.disbursedAt},
            #{record.index},
            #{record.totalIndex},
            #{record.principle},
            #{record.interest},
            #{record.compensateAmount},
            #{record.compenAt},
            NOW(),
            NOW()
            )
        </foreach>
    </insert>
```

###### 编号118
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuLoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuLoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.jimu.model.JimuLoans">
        insert into jimu_loans (application_id,apply_id,bank_card_status,service_no,return_url,account_no,order_id,created_at,updated_at)
        values(#{applicationId},#{applyId},#{bankCardStatus},#{serviceNo},#{returnUrl},#{accountNo},#{orderId},now(),now())
    </insert>
```

###### 编号119
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuLoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuLoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateBankCardStatus">
        update jimu_loans set bank_card_status = #{status},updated_at=now() where id = #{id}
    </update>
```

###### 编号120
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuLoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuLoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.jimu.model.JimuLoans">
        update jimu_loans
        <set>
            <if test="bankCardStatus != null">
                bank_card_status = #{bankCardStatus},
            </if>
            <if test="applyId != null">
                apply_id = #{applyId},
            </if>
            <if test="serviceNo != null">
                service_no = #{serviceNo},
            </if>
            <if test="accountNo != null">
                account_no = #{accountNo},
            </if>
            <if test="returnUrl != null">
                return_url = #{returnUrl},
            </if>
             <if test="userCode != null">
                user_code = #{userCode},
            </if>
            <if test="orderId != null">
                order_id = #{orderId},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号121
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertTransactions" parameterType="com.wolaidai.jimu.model.JimuTransactions">
        INSERT INTO jimu_transactions(application_id,request,project_id,service_no,apply_business_no,amount,coupon_amount,settle_index,status,user_id,apply_type,debit_source,repay_model,repay_at,created_at,updated_at)
        VALUES (
          #{record.applicationId},
          #{record.request},
          #{record.projectId},
          #{record.serviceNo},
          #{record.applyBusinessNo},
          #{record.amount},
          #{record.couponAmount},
          #{record.settleIndex},
          #{record.status},
          #{record.userId},
          #{record.applyType},
          #{record.debitSource},
          #{record.repayModel},
          #{record.repayAt},
          NOW(),
          NOW()
        )
    </insert>
```

###### 编号122
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateJimuTransactions">
        update jimu_transactions
        <set>
            <if test="applicationId != null">
                application_id = #{applicationId},
            </if>
            <if test="projectId != null">
                project_id = #{projectId},
            </if>
            <if test="serviceNo != null">
                service_no = #{serviceNo},
            </if>
            <if test="applyBusinessNo != null">
                apply_business_no = #{applyBusinessNo},
            </if>
            <if test="amount != null">
                amount = #{amount},
            </if>
            <if test="couponAmount != null">
                coupon_amount = #{couponAmount},
            </if>
            <if test="settleIndex != null">
                settle_index = #{settleIndex},
            </if>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="request != null">
                request = #{request},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            <if test="userId != null">
                user_id = #{userId},
            </if>
            <if test="applyType != null">
                apply_type = #{applyType},
            </if>
            <if test="debitSource != null">
                debit_source = #{debitSource},
            </if>
            <if test="repayModel != null">
                repay_model = #{repayModel},
            </if>
            <if test="repayAt != null">
                repay_at = #{repayAt},
            </if>
            <if test="createdAt != null">
                created_at = #{createdAt},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号123
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/JimuTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert">
        INSERT INTO jimu_transactions(application_id,request,project_id,service_no,apply_business_no,amount,coupon_amount,settle_index,status,user_id,apply_type,debit_source,repay_model,repay_at,created_at,updated_at) values
        <foreach collection="list" item="item" index="index" separator=",">
            (
            #{item.applicationId},
            #{item.request},
            #{item.projectId},
            #{item.serviceNo},
            #{item.applyBusinessNo},
            #{item.amount},
            #{item.couponAmount},
            #{item.settleIndex},
            #{item.status},
            #{item.userId},
            #{item.applyType},
            #{item.debitSource},
            #{item.repayModel},
            #{item.repayAt},
            NOW(),
            NOW()
            )
        </foreach>
    </insert>
```

###### 编号124
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.jimu.model.LoanTaskDetails">
    insert into jimu_task_details (
      order_no,project_id,application_id, step, type, description,
      status, created_at, updated_at
    ) values (
      #{orderNo,jdbcType=VARCHAR},
       #{projectId,jdbcType=INTEGER},
      #{applicationId,jdbcType=VARCHAR},
      #{step,jdbcType=INTEGER}, #{type,jdbcType=VARCHAR},
      #{description,jdbcType=VARCHAR}, #{status,jdbcType=VARCHAR},
      now(), now()
    )
  </insert>
```

###### 编号125
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStep">
    update jimu_task_details set status = #{status},updated_at = now(),request=#{request},response=#{response} where application_id = #{applicationId} and step = #{step}
  </update>
```

###### 编号126
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePorjectId">
    update jimu_task_details set project_id = #{projectId},updated_at = now() where order_no = #{orderNo}
  </update>
```

###### 编号127
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.jimu.model.LoanTaskDetails">
    update jimu_task_details
    <set>
      <if test="status != null">
        status = #{status},
      </if>
      <if test="request != null">
        request = #{request},
      </if>
      <if test="response != null">
        response = #{response},
      </if>
      updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号128
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.jimu.model.LoanTasks">
        insert into jimu_tasks (order_no,project_id,application_id,user_id, status,created_at, updated_at,disbursed_at) values (
          #{orderNo,jdbcType=VARCHAR},
           #{projectId,jdbcType=INTEGER},
          #{applicationId,jdbcType=VARCHAR},
          #{userId,jdbcType=INTEGER},
          #{status,jdbcType=VARCHAR},
          now(),
          now(),
          #{disbursedAt,jdbcType=TIMESTAMP}
        )
  </insert>
```

###### 编号129
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatusAndDisbursedAt">
        update jimu_tasks set status = #{status},updated_at = now()
        <if test="disbursedAt != null">
            ,disbursed_at = #{disbursedAt}
        </if>
        where project_id = #{projectId}
    </update>
```

###### 编号130
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateProjectIdAndStatus">
         update jimu_tasks set status = #{status},updated_at = now(),project_id = #{projectId} where order_no = #{orderNo}
    </update>
```

###### 编号131
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatusByApplicationId">
         update jimu_tasks set status = #{status},updated_at = now()  where application_id = #{applicationId}
    </update>
```

###### 编号132
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/RepurchaseInfoMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jimu-investment/blob/production/src/main/resources/mapper/RepurchaseInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepurchaseRecord" parameterType="com.wolaidai.jimu.model.RepurchaseApplications">
	update repurchase_applications set
	updated_at  = now()
	<if test="item.status != null">
	, status = #{item.status}
	</if>
		<if test="item.statusDsc != null">
	, status_dsc = #{item.statusDsc}
	</if>
		<if test="item.realPrincipal != null">
	, real_principal = #{item.realPrincipal}
	</if>
		<if test="item.realInterest != null">
	, real_interest = #{item.realInterest}
	</if>
	where id = #{item.id}
	</update>
```

###### 编号133
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jincheng-guarantee-investment/blob/production/src/main/resources/mapper/BankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jincheng-guarantee-investment/blob/production/src/main/resources/mapper/BankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="selectDeleteBankCard" resultMap="BankCardMap">
        SELECT *
        FROM bank_cards b
        WHERE b.deleted_at BETWEEN now() - INTERVAL'3D' AND now()
          AND b.pay_code = '0064'
          AND NOT exists(SELECT 1 FROM jincheng_bank_cards j WHERE j.old_bank_card_id = b.id)
    </select>
```

###### 编号134
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jincheng-guarantee-investment/blob/production/src/main/resources/mapper/JinchengGuaranteeTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jincheng-guarantee-investment/blob/production/src/main/resources/mapper/JinchengGuaranteeTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="findRepayList" resultMap="jinchengTransactions">
        select * from jincheng_guarantee_transactions
        where <include refid="timeRestrict"/>
        and debit_source in ('normal','offline_today','not_offline_today','overdue')
        and status = 'none'
        limit 200
    </select>
```

###### 编号135
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jincheng-guarantee-investment/blob/production/src/main/resources/mapper/JinchengGuaranteeTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jincheng-guarantee-investment/blob/production/src/main/resources/mapper/JinchengGuaranteeTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="findRiskRepaysList" resultMap="jinchengTransactions">
        select * from jincheng_guarantee_transactions
        where <include refid="timeRestrict"/>
        and debit_source in ('offline_today','not_offline_today')
        and status in
        <foreach collection="list" item="status" open="(" close=")" separator=",">
            #{status}
        </foreach>
    </select>
```

###### 编号136
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jincheng-guarantee-investment/blob/production/src/main/resources/mapper/JinchengGuaranteeTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jincheng-guarantee-investment/blob/production/src/main/resources/mapper/JinchengGuaranteeTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="findWithholdRepaysList" resultMap="jinchengTransactions">
        select * from jincheng_guarantee_transactions
        where <include refid="timeRestrict"/>
        and debit_source in ('normal','withhold')
        and status in
        <foreach collection="list" item="status" open="(" close=")" separator=",">
            #{status}
        </foreach>
    </select>
```

###### 编号137
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/CallBackErrorMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/CallBackErrorMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="saveCallBackError" parameterType="string">
        insert into call_back_error (seq_no, state, callback_url, start_time, error_count, msg)
        values
        (#{seqNo}, '01', #{callBackUrl}, now(), 0, #{msg})
    </select>
```

###### 编号138
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/ChangeCardMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/ChangeCardMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateChangeCard">
		update jintou_change_cards
		<set>
			<if test="state != null">
				state = #{state},
			</if>
			<if test="note != null">
				note = #{note},
			</if>
			updated_at = now()
		</set>
		where id = #{id} and 	state = #{oldstate}
	</update>
```

###### 编号139
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouClearsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouClearsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertJinTouClears" parameterType="com.wolaidai.jintou.model.JinTouClear">
        insert into jintou_clears
        (order_no, application_id, serial_no, loanserialno, periodno, paystatus, amount, failreason, clearstatus, clearamount, inputdate, ret_code, ret_msg, created_at, updated_at)
        values
        (#{orderno}, #{applicationId}, #{serialno}, #{loanserialno}, #{loanperiodno}, #{paystatus}, #{repayAmount}, #{failreason}, #{clearstatus}, #{clearingAmount}, #{inputdate}, #{retCode}, #{retMsg}, now(), now())
    </insert>
```

###### 编号140
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouDocMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouDocMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.jintou.model.JinTouDoc">
        insert into jintou_documents(user_id,application_id,doc_type,doc_url,remark,created_at,updated_at)
        values(#{userId},#{applicationId},#{docType},#{docUrl},#{remark},now(),now())
    </insert>
```

###### 编号141
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouDues.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouDues.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.jintou.model.JinTouDues">
        INSERT INTO jintou_dues(application_id,lous_num,index,principal,interest,principal_balance,penalty,pay_date,finish_date,serial_no,prepay_amount,created_at,updated_at)
        VALUES (#{applicationId},#{lousNum},#{index},#{principal},#{interest},#{principalBalance},#{penalty},#{payDate},#{finishDate},#{serialNo},#{prepayAmount},now(),now())
    </insert>
```

###### 编号142
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouDues.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouDues.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="java.util.List">
        INSERT INTO jintou_dues(application_id,lous_num,index,principal,interest,principal_balance,penalty,pay_date,finish_date,serial_no,prepay_amount,created_at,updated_at)
        values
        <foreach collection="list" item="item" index="index" separator=",">
        (#{item.applicationId},#{item.lousNum},#{item.index},#{item.principal},#{item.interest},#{item.principalBalance},
         #{item.penalty},#{item.payDate},#{item.finishDate},#{item.serialNo},#{item.prepayAmount},now(),now())
        </foreach>
    </insert>
```

###### 编号143
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouRepayPlan.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouRepayPlan.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.jintou.model.JinTouRepayPlan">
        INSERT INTO jintou_repay_plan(serialno,lous_num,contract_serialno,customer_name,uuid,due_index,pay_date,principal,actual_principal,interest,actual_interest,principal_balance,penalty,
        actual_penalty,finish_date,is_compensatory,is_prepay,prepay_amount,created_at,updated_at,jintou_principal,jintou_interest,is_checked,is_missed,is_overdue,coupon_amount)
        VALUES (
        #{serialno},#{objectno},#{contractserialno},#{customername},#{mfcustomerid},#{periodno},#{paydate},#{payprincipalamt},#{actualpayprincipalamt},#{payinterestamt},#{actualpayinterestamt},
        #{principalbalance},#{payprincipalpenaltyamt},#{actualpayprincipalpenaltyamt},#{finishdate},#{iscompensatory},#{isprepay},#{prepayamt},now(),now(),#{jintouPrincipal},#{jintouInterest},
        #{ischecked},#{isMissed},#{isOverdue},#{couponAmount}
        )
    </insert>
```

###### 编号144
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouRepayPlan.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouRepayPlan.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.jintou.model.JinTouRepayPlan">
        update jintou_repay_plan
        <set>
            <if test="finishdate != null">
                finish_date = #{finishdate},
            </if>
            <if test="ischecked != null">
                is_checked = #{ischecked},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号145
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouRepayResultMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/JinTouRepayResultMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.jintou.model.JinTouRepayResult">
        INSERT INTO jintou_repay_result(serialno,lous_num,due_index,total_amount,principal,principal_balance,state,
        is_overdue,is_prepay,finish_date,created_at,updated_at)
        VALUES (#{serialNo},#{lousNum},#{dueIndex},#{totalAmount},#{principal},#{principalBalance},#{state},
        #{isOverDue},#{isPrepay},#{finishDate},now(),now())
    </insert>
```

###### 编号146
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanTask" parameterType="com.wolaidai.jintou.model.LoanTasks">
		insert into jintou_tasks(order_no,application_id,uuid,user_id,state,curr_step,created_at,updated_at,serial_no,is_loaded)
		values(#{orderNo},#{applicationId},#{uuid},#{userId},#{state},#{currStep},now(),now(),#{serialNo},0);
	</insert>
```

###### 编号147
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanTaskDetail" parameterType="com.wolaidai.jintou.model.LoanTaskDetails">
		insert into jintou_task_details(order_no,application_id,state,step,type,description,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{state},#{step},#{type},#{description},now(),now())
	</insert>
```

###### 编号148
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanTaskDetail" parameterType="com.wolaidai.jintou.model.LoanTaskDetails">
        update jintou_task_details
        <set>
            <if test="orderNo != null">
                order_no = #{orderNo},
            </if>
            <if test="applicationId != null">
                application_id = #{applicationId},
            </if>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="step != null">
                step = #{step},
            </if>
            <if test="type != null">
                type = #{type},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号149
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanTask">
        update jintou_tasks
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="lousNum != null">
                lous_num = #{lousNum},
            </if>
            <if test="currStep != null">
                curr_step = #{currStep},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号150
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/RepoApplMapper.xml](https://git.wolaidai.com/WelabCo/Lender/jintou-investment/blob/production/src/main/resources/mapper/RepoApplMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="UpdateRepoStatus" parameterType="com.wolaidai.jintou.web.request.RepoConfirmReq">
        update repurchase_applications
        <set>
            <if test="repoConfirm.status != null">
                status = #{repoConfirm.status},
            </if>
            <if test="repoConfirm.dscMsg != null">
                status_dsc = #{repoConfirm.dscMsg},
            </if>
            updated_at = now()
        </set>
        where application_id = #{repoConfirm.applicationId}
    </update>
```

###### 编号151
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/CouponsUserMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/CouponsUserMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertCouponsParamInfo" parameterType="com.wolaidai.ws.jrocket2.rong360.request.CouponsParamRequest">
		INSERT INTO
			coupons_param (order_no, ticket_type, amount, unit, created_at)
		VALUES
			(#{orderNo}, #{ticketType}, #{amount}, #{unit},now())
	</insert>
```

###### 编号152
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/CouponsUserMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/CouponsUserMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateCouponsScheduleInfo" parameterType="map">
		UPDATE coupons_schedule SET redeemed = 'YES',updated_at = now() WHERE user_id = #{userId} and coupon_id = #{couponId}
	</update>
```

###### 编号153
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/LoanApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/LoanApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getLightingLoanApplicationAfterMins" resultType="com.wolaidai.ws.jrocket2.persistence.LoanApplication">
		select * from loan_applications WHERE
		state in ('applied','init_aip')
		AND welab_product_id = #{lightingProductId}
		AND suspended is not TRUE
		AND push_backed_at is NULL
		and (applied_at + (INTERVAL '1 min' * #{mins})) &lt;= (now() at time zone 'utc')
		AND expected_aip_finished_at &gt; (now() at time zone 'utc')
	</select>
```

###### 编号154
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/LoanApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/LoanApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="cancelApprovedLoanApplication" parameterType="java.lang.String">
		UPDATE 
			loan_applications
		SET state='cancelled',updated_at=now()
		WHERE 
			application_id = #{application_id}
		AND 
			state = 'aip'
	</update>
```

###### 编号155
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/PartnerRelaParamMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/PartnerRelaParamMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertPartnerRelaParamObj" useGeneratedKeys="true" keyProperty="id" parameterType="PartnerRelaParam">
		INSERT INTO 
			partner_rela_param (source,application_id,key,value,created_at,updated_at)
		VALUES  
			(#{ source}, #{ application_id}, #{ key}, #{ value}, now(),now())
	</insert>
```

###### 编号156
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/PartnerRelaParamMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/PartnerRelaParamMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertPartnerRelaParam" useGeneratedKeys="true">
		INSERT INTO 
			partner_rela_param (source,application_id,key,value,created_at,updated_at)
		VALUES  
			(#{ source}, #{ application_id}, #{ key}, #{ value}, now(),now())
	</insert>
```

###### 编号157
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/PartnerRelaParamMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/PartnerRelaParamMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePartnerRelaParamById" parameterType="PartnerRelaParam">
		UPDATE 
			partner_rela_param
		<set>
			<if test="source != null">
				source = #{source},
			</if>
			<if test="application_id != null">
				application_id = #{application_id},
			</if>
			<if test="key != null">
				key = #{key},
			</if>
			<if test="value != null">
				value = #{value},
			</if>
			updated_at=now()
		</set>
		WHERE 
			id = #{id}
	</update>
```

###### 编号158
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/PartnerRelaParamMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/PartnerRelaParamMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePartnerRelaParamByApplicationIdSourceKey">
		UPDATE
			partner_rela_param
		set
			value = #{value},
			updated_at=now()
		WHERE
			key = #{key} 
		and
			source = #{source} 
		and
			application_id = #{application_id}
	</update>
```

###### 编号159
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateUserRoleTypeInBatchWithStuRole">
		update users set role_type=2,updated_at=now() where id in
		<foreach item="item" index="index" collection="userIds" open="(" separator="," close=")">
			#{item}
		</foreach>
		and role_type=1
	</update>
```

###### 编号160
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="repairProfilePositionIdOf1">
		update profiles set position_id=1000,updated_at=now() where id in
		<foreach item="item" index="index" collection="ids" open="(" separator="," close=")">#{item}</foreach>
		and position_id=1
	</update>
```

###### 编号161
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDistrict440183To440118">
		update addresses set district ='440118',updated_at=now() where id in
		<foreach item="item" index="index" collection="ids" open="(" separator="," close=")">#{item}</foreach>
		and district ='440183'
	</update>
```

###### 编号162
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDistrict440184To440117">
		update addresses set district ='440117',updated_at=now() where id in
		<foreach item="item" index="index" collection="ids" open="(" separator="," close=")">#{item}</foreach>
		and district ='440184'
	</update>
```

###### 编号163
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDistrict370882To370812">
		update addresses set district ='370812',updated_at=now() where id in
		<foreach item="item" index="index" collection="ids" open="(" separator="," close=")">#{item}</foreach>
		and district ='370882'
	</update>
```

###### 编号164
**git地址**  
[https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml](https://git.wolaidai.com/welabco/tc/jrocket2/blob/production/src/main/resources/com/wolaidai/ws/jrocket2/persistence/mapper/RepairCreditApplicationMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDistrict360782To360703">
		update addresses set district ='360703',updated_at=now() where id in
		<foreach item="item" index="index" collection="ids" open="(" separator="," close=")">#{item}</foreach>
		and district ='360782'
	</update>
```

###### 编号165
**git地址**  
[https://git.wolaidai.com/welabco/legacy/jrocket2-bkofficer/blob/production/src/main/resources/com/wolaidai/jrocket2/bkofficer/persistence/mapper/PushMessageMapper.xml](https://git.wolaidai.com/welabco/legacy/jrocket2-bkofficer/blob/production/src/main/resources/com/wolaidai/jrocket2/bkofficer/persistence/mapper/PushMessageMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="getPushMessagesForSchedule" resultType="com.wolaidai.jrocket2.bkofficer.persistence.PushMessage">
	<![CDATA[ 
		SELECT 
			id, target_platform, push_mode, push_type, account, query_params,
			file_path, ticker, title, text, push_status, push_time, start_time,
			expire_hours, created_at, updated_at
		FROM push_messages 
		WHERE push_mode = 'delay' 
		And push_status = 'waiting'
		And start_time <= (select now() at time zone 'utc')
	]]>
	</select>
```

###### 编号166
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.kaolainvestment.model.KaolaBankCards">
    insert into kaola_bank_cards(application_id,subject_id,kaola_user_id,order_id,html,state,return_url,ret_msg,ret_code,created_at,updated_at,user_id,seq_no,request)
    values(#{applicationId},#{subjectId},#{kaolaUserId},#{orderId},#{html},#{state},#{returnUrl},#{retMsg},#{retCode},now(),now(),#{userId},#{seqNo},#{request});
  </insert>
```

###### 编号167
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.kaolainvestment.model.KaolaBankCards">
    update kaola_bank_cards
    <set>
      <if test="loanOrderId != null">
        loan_order_id = #{loanOrderId},
      </if>
      <if test="seqNo != null">
        seq_no = #{seqNo},
      </if>
      <if test="returnUrl != null">
        return_url = #{returnUrl},
      </if>
      <if test="kaolaUserId != null">
        kaola_user_id = #{kaolaUserId},
      </if>
      <if test="state != null">
        state = #{state},
      </if>
      <if test="retMsg != null">
        ret_msg = #{retMsg},
      </if>
      <if test="retCode != null">
        ret_code = #{retCode},
      </if>
      <if test="response != null">
        response = #{response},
      </if>
        updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号168
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaDebtMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaDebtMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.kaolainvestment.model.KaolaDebt" useGeneratedKeys="true" keyProperty="id">
    insert into kaola_debit (amount,subject_id,debit_time,note_id,assignment_id,seller_id,buyer_id,
                              seller_idcard,seller_name,buyer_idcard,buyer_name,constract_infos,created_at,updated_at)
    values (#{amount},#{subjectId},#{time},#{noteId},#{assignmentId},#{sellerId},#{buyerId},
    #{sellerIdCard},#{sellerName},#{buyerIdCard},#{buyerName},#{constract},now(),now())
  </insert>
```

###### 编号169
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchSave">
    insert into kaola_dues (application_id, no, repay_date,
    repay_principal, repay_interest, created_at,
    updated_at)
    values
    <foreach collection="kaolaDues" item="item" index="index" separator=",">

      (
      #{item.applicationId,jdbcType=VARCHAR}, #{item.no,jdbcType=INTEGER}, #{item.repayDate,jdbcType=VARCHAR},
      #{item.repayPrincipal,jdbcType=NUMERIC}, #{item.repayInterest,jdbcType=NUMERIC}, now()),
      now()
      )
    </foreach>
  </insert>
```

###### 编号170
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaLendersMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaLendersMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchSave">
    insert into kaola_lenders (application_id, name, id_card,
    amount, date, created_at,
    updated_at)
    values
    <foreach collection="lenders" item="item" index="index" separator=",">

      (
      #{item.applicationId,jdbcType=VARCHAR}, #{item.name,jdbcType=VARCHAR}, #{item.idCard,jdbcType=VARCHAR},
      #{item.amount,jdbcType=NUMERIC}, #{item.date,jdbcType=TIMESTAMP}, now(),now()
      )
    </foreach>
  </insert>
```

###### 编号171
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaUserAgreementsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaUserAgreementsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.kaolainvestment.model.KaolaUserAgreements">
    insert into kaola_user_agreements(user_id,kaola_user_id,seq_no,state,request,response,created_at,updated_at)
    values(#{userId},#{kaolaUserId},#{seqNo},#{state},#{request},#{response},now(),now());
  </insert>
```

###### 编号172
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaUserAgreementsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/KaolaUserAgreementsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.kaolainvestment.model.KaolaUserAgreements">
    update kaola_user_agreements
    <set>
      <if test="seqNo != null">
        seq_no = #{seqNo},
      </if>
      <if test="kaolaUserId != null">
        kaola_user_id = #{kaolaUserId},
      </if>
      <if test="state != null">
        state = #{state},
      </if>
      <if test="request != null">
        request = #{request},
      </if>
      <if test="response != null">
          response = #{response},
      </if>
        updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号173
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/LoanTaskDetailMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/LoanTaskDetailMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateByApplicationId">
    update kaola_task_details
    <set>

      <if test="loanTaskDetail.state != null">
        state = #{loanTaskDetail.state, jdbcType=VARCHAR},
      </if>
      <if test="loanTaskDetail.retCode != null">
        ret_code = #{loanTaskDetail.retCode, jdbcType=VARCHAR},
      </if>
      <if test="loanTaskDetail.retMsg != null">
        ret_msg = #{loanTaskDetail.retMsg, jdbcType=VARCHAR},
      </if>

        updated_at = now()
    </set>

    where application_id=#{loanTaskDetail.applicationId} and step=#{loanTaskDetail.step}
  </update>
```

###### 编号174
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/kaola-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanTaskByApplicationId">
        update kaola_tasks
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="step != null">
                curr_step = #{step},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号175
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/PartnerRelaParamMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/PartnerRelaParamMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertPartnerRelaParamObj" useGeneratedKeys="true" keyProperty="id" parameterType="com.welab.loan.diversions.model.PartnerRelaParam">
		INSERT INTO 
			partner_rela_param (source,application_id,key,value,created_at,updated_at)
		VALUES  
			(#{ source}, #{ application_id}, #{ key}, #{ value}, now(),now())
	</insert>
```

###### 编号176
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/PartnerRelaParamMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/PartnerRelaParamMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertPartnerRelaParam" useGeneratedKeys="true">
		INSERT INTO 
			partner_rela_param (source,application_id,key,value,created_at,updated_at)
		VALUES  
			(#{ source}, #{ application_id}, #{ key}, #{ value}, now(),now())
	</insert>
```

###### 编号177
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/PartnerRelaParamMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/PartnerRelaParamMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePartnerRelaParamById" parameterType="com.welab.loan.diversions.model.PartnerRelaParam">
		UPDATE 
			partner_rela_param
		<set>
			<if test="source != null">
				source = #{source},
			</if>
			<if test="application_id != null">
				application_id = #{application_id},
			</if>
			<if test="key != null">
				key = #{key},
			</if>
			<if test="value != null">
				value = #{value},
			</if>
			updated_at=now()
		</set>
		WHERE 
			id = #{id}
	</update>
```

###### 编号178
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/ThirdSeqApplicationIdRefMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/ThirdSeqApplicationIdRefMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.welab.loan.diversions.dto.ThirdSeqApplicationIdRefDTO">
        insert into thirdseq_applicationId_ref(application_id,thirdseq,partner_code,created_at,updated_at)
        values (#{application_id},#{thirdseq},#{partner_code},now(),now())
    </insert>
```

###### 编号179
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="insertContractOpenState" parameterType="com.welab.loan.diversions.model.YdRhzxContractOpenState" resultType="Integer">
    	INSERT INTO guarantee_contract_open_status (serial_number,guarantor_id,state,error_msg,upload_date,updated_at,created_at)
		VALUES (#{serial_number},#{guarantor_id},#{state},#{error_msg},#{upload_date},now(),now())
	</select>
```

###### 编号180
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateContractOpenState" parameterType="com.welab.loan.diversions.model.YdRhzxContractOpenState">
		update
			guarantee_contract_open_status
		set
		<if test="state !=null and state !=''">
			state=#{state},
		</if>
		<if test="error_msg !=null and error_msg !=''">
			error_msg=#{error_msg},
		</if>
		updated_at=now()
		where
		guarantor_id = #{guarantor_id}
		and serial_number=#{serialNumber}
	</update>
```

###### 编号181
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="batchUpdateContractOpenState" parameterType="com.welab.loan.diversions.model.YdRhzxContractOpenState">
		update
		guarantee_contract_open_status
		set
		<if test="state !=null and state !=''">
			state=#{state},
		</if>
		<if test="error_msg !=null and error_msg !=''">
			error_msg=#{error_msg},
		</if>
		updated_at=now()
		where
		serial_number=#{serialNumber}
		and guarantor_id in
		<foreach open="(" close=")" collection="guarantorIdList" separator="," item="guarantor_id" index="index">
			#{guarantor_id}
		</foreach>
	</update>
```

###### 编号182
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="insertCompensatoryState" parameterType="com.welab.loan.diversions.model.YdRhzxCompensatoryState" resultType="Integer">
    	INSERT INTO compensation_overview_status (serial_number,guarantor_id,business_date,state,error_msg,upload_date,updated_at,created_at)
		VALUES (#{serial_number},#{guarantor_id},#{business_date},#{state},#{error_msg},#{upload_date},now(),now())
	</select>
```

###### 编号183
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="insertRecoveryState" parameterType="com.welab.loan.diversions.model.YdRhzxRecoveryState" resultType="Integer">
    	INSERT INTO additional_compensation_detail_long_status(serial_number,guarantor_id,business_date,state,error_msg,upload_date,updated_at,created_at)
		VALUES (#{serial_number},#{guarantor_id},#{business_date},#{state},#{error_msg},#{upload_date},now(),now())
	</select>
```

###### 编号184
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateCompensatoryState" parameterType="com.welab.loan.diversions.model.YdRhzxCompensatoryState">
		update
		compensation_overview_status
		set
		<if test="state !=null and state !=''">
			state=#{state},
		</if>
		<if test="error_msg !=null and error_msg !=''">
			error_msg=#{error_msg},
		</if>
		updated_at=now()
		where
		guarantor_id = #{guarantor_id}
		and serial_number=#{serialNumber}
	</update>
```

###### 编号185
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRecoveryState" parameterType="com.welab.loan.diversions.model.YdRhzxRecoveryState">
		update
		additional_compensation_detail_long_status
		set
		<if test="state !=null and state !=''">
			state=#{state},
		</if>
		<if test="error_msg !=null and error_msg !=''">
			error_msg=#{error_msg},
		</if>
		updated_at=now()
		where
		guarantor_id = #{guarantor_id}
		and serial_number=#{serialNumber}
	</update>
```

###### 编号186
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="batchUpdateCompensatoryState" parameterType="com.welab.loan.diversions.model.YdRhzxCompensatoryState">
		update
		compensation_overview_status
		set
		<if test="state !=null and state !=''">
			state=#{state},
		</if>
		<if test="error_msg !=null and error_msg !=''">
			error_msg=#{error_msg},
		</if>
		updated_at=now()
		where
		serial_number=#{serialNumber}
		and guarantor_id in
		<foreach open="(" close=")" collection="guarantorIdList" separator="," item="guarantor_id" index="index">
			#{guarantor_id}
		</foreach>
	</update>
```

###### 编号187
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml](https://git.wolaidai.com/WelabCo/TC/loan-diversions/blob/production/loan-diversions-core/src/main/resources/mapper/YdRhzxQueryStateMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="batchUpdateRecoveryState" parameterType="com.welab.loan.diversions.model.YdRhzxRecoveryState">
		update
		additional_compensation_detail_long_status
		set
		<if test="state !=null and state !=''">
			state=#{state},
		</if>
		<if test="error_msg !=null and error_msg !=''">
			error_msg=#{error_msg},
		</if>
		updated_at=now()
		where
		serial_number=#{serialNumber}
		and guarantor_id in
		<foreach open="(" close=")" collection="guarantorIdList" separator="," item="guarantor_id" index="index">
			#{guarantor_id}
		</foreach>
	</update>
```

###### 编号188
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/BankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/BankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateBankCardMobileById">
        update bank_cards set mobile = #{mobile}, updated_at = now()
        where id = #{id};
    </update>
```

###### 编号189
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/DuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/DuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertChargeDuesSettlements" parameterType="com.wolaidai.miscservice.model.ChargeDuesSettlements">
        INSERT INTO charge_dues_settlements (charge_due_id,org_id,lender_id,user_id,application_id,index_no,due_date,due_type,amount,due_amount,settled_date,settled_amount,created_at,updated_at,service_no)
        values(#{chargeDueId}, #{orgId}, #{lenderId}, #{userId}, #{applicationId}, #{indexNo}, #{dueDate}, #{dueType}, #{dueAmount}, #{dueAmount}, #{settledDate}, #{settledAmount}, now(),now(),#{serviceNo})
    </insert>
```

###### 编号190
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/LoanAttributeMapper.xml](https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/LoanAttributeMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateNextDate">
        update loan_attribute
        set next_repayment_date = #{nextRepayDate},
        next_reimbursement_date = #{nextReimburseDate},
        payment_schedule_type = 'FIXEDDATECALCULATORV3',
        overdue_penalty_type = 'by_installment',
        repayment_type = 'by_installment',
        reimbursement_type = 'risk',
        is_allow_early_settle = 'false',
        loan_mode = 'capital',
        repay_mode = 'welab',
        clear_mode = 'fixedtime',
        updated_at = now()
        where application_id = #{applicationId}
    </update>
```

###### 编号191
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/LoanFallBackMapper.xml](https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/LoanFallBackMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoansStatus">
        UPDATE loans SET STATE = #{status}, updated_at = now() WHERE id IN ( SELECT id FROM loans WHERE application_id = #{applicationId});
    </update>
```

###### 编号192
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/LoanFallBackMapper.xml](https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/LoanFallBackMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanApplicationStatus">
        UPDATE loan_application SET status = #{status}, updated_at = now() WHERE application_id = #{applicationId};
    </update>
```

###### 编号193
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/LoanFallBackMapper.xml](https://git.wolaidai.com/WelabCo/Lender/misc-service/blob/production/src/main/resources/mapper/LoanFallBackMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanProcedure">
        UPDATE loan_procedures SET status = #{status}, updated_at = now() WHERE application_id  = #{applicationId};
    </update>
```

###### 编号194
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="increaseAccountsAmount">
		update accounts set ${balanceType} = ${balanceType} + #{amount},updated_at=now() where id = #{accountId}
	</update>
```

###### 编号195
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="increaseAccountsSuAmount">
		update accounts_su set ${balanceType} = ${balanceType} + #{amount},updated_at=now() where id = #{accountSuId}
	</update>
```

###### 编号196
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="decreaseAccountsAmount">
		update accounts set ${balanceType} = ${balanceType} - #{amount},updated_at=now() where id = #{accountId}
	</update>
```

###### 编号197
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/AccountsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/AccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="decreaseAccountsSuAmount">
		update accounts_su set ${balanceType} = ${balanceType} - #{amount},updated_at=now() where id = #{accountSuId}
	</update>
```

###### 编号198
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLmrStateByApplicationId">
    update lender_matching_records set state = #{newState}, updated_at = now()
    where application_id = #{applicationId} and state = #{oldState}
    </update>
```

###### 编号199
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanBidRelation" useGeneratedKeys="true">
    insert into loan_bid_relations(id, created_at, updated_at, loan_id, bid_record_id, amount)
    values(#{primaryKey}, now(),  now(), #{loanId}, #{bidRecordId}, #{amount})
    </insert>
```

###### 编号200
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanLender">
    update loan_lenders set lender_id = #{lenderId}, updated_at = now() where loan_id = #{loanId}
    </update>
```

###### 编号201
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="createCreditAssignApplication" useGeneratedKeys="true">
insert into credit_assign_application(application_id, original_lender_id, new_lender_id, credit_amount, operator_id, state, updated_at, created_at)
values(#{applicationId}, #{oldLenderId}, #{newLenderId}, #{creditAmount}, #{operatorId}, 'SUCCESS', now(), now() )
</insert>
```

###### 编号202
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/BidsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="createCreditAssignment">
insert into credit_assignments(loan_id, original_lender_id, new_lender_id, updated_at, created_at)
values (#{loanId}, #{oldLenderId}, #{newLenderId}, now(), now() )
</insert>
```

###### 编号203
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/CallBackErrorMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/CallBackErrorMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertCallBackError" parameterType="com.wolaidai.repayment.model.CallBackError">
        insert into call_back_error(seq_no, state, callback_url, start_time, end_time, error_count, msg)
        values(#{seqNo}, #{state}, #{callBackUrl}, now(), now(), 0, #{msg})
    </insert>
```

###### 编号204
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/CashFlowStatementsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/CashFlowStatementsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertCashFlowStatement" parameterType="com.wolaidai.repayment.model.CashFlowStatements">
        insert into cash_flow_statements(owner_id, owner_type, seq_no, code, trade_date, pay_code, cash_flow_id,
         amount, state, started_at, end_at, trans_state, trans_remark, user_name, cn_id, bank_name, bank_acc_no, loan_id)
        values(#{ownerId}, #{ownerType}, #{seqNo}, #{code}, #{tradeDate}, #{payCode}, #{cashFlowId},
         #{amount}, #{state}, now(), now(), #{transState}, #{transRemark}, #{userName}, #{cnId}, #{bankName}, #{bankAccNo}, #{loanId})
    </insert>
```

###### 编号205
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/CashFlowStatementsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/CashFlowStatementsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateCashFlowStatementBySeqNo" parameterType="com.wolaidai.repayment.model.CashFlowStatements">
        update cash_flow_statements
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="transRemark != null">
                trans_remark = #{transRemark},
            </if>
            end_at = now()
        </set>
        where seq_no = #{seqNo}
    </update>
```

###### 编号206
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ChargeDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ChargeDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateChargeDuesAmountById" parameterType="com.wolaidai.repayment.model.ChargeDues">
        UPDATE charge_dues SET outstanding_amount = #{outstandingAmount},settled_amount = #{settleAmount},updated_at= now() WHERE id = #{id}
    </update>
```

###### 编号207
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ChargeDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ChargeDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateChargeDuesAmountByIndex" parameterType="com.wolaidai.repayment.model.ChargeDues">
        UPDATE charge_dues SET outstanding_amount = #{outstandingAmount},settled_amount = 0,updated_at= now() WHERE application_id = #{applicationId} and index = #{index} and due_type = 'interest'
    </update>
```

###### 编号208
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ChargeDuesSettlementsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ChargeDuesSettlementsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertChargeDuesSettlements" parameterType="com.wolaidai.repayment.model.ChargeDuesSettlements">
        INSERT INTO charge_dues_settlements (charge_due_id,org_id,lender_id,user_id,application_id,index_no,due_date,due_type,amount,due_amount,settled_date,settled_amount,created_at,updated_at,service_no)
        values(#{chargeDueId}, #{orgId}, #{lenderId}, #{userId}, #{applicationId}, #{indexNo}, #{dueDate}, #{dueType}, #{dueAmount}, #{dueAmount}, #{settledDate}, #{settledAmount}, now(),now(),#{serviceNo})
    </insert>
```

###### 编号209
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/DueSettlementsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/DueSettlementsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertDueSettlements" parameterType="com.wolaidai.repayment.model.DueSettlements">
        insert into due_settlements(account_transaction_id, due_id, amount, created_at, updated_at)
        values(#{accountTransactionId}, #{dueId}, #{amount}, now(), now())
    </insert>
```

###### 编号210
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/DuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/DuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertDues" parameterType="com.wolaidai.repayment.model.Dues">
		insert into dues(loan_id, index, amount, due_date, due_type, created_at, updated_at, settled_amount)
		values(#{loanId}, #{index}, #{amount}, #{dueDate}, #{dueType}, now(), now(), 0)
	</insert>
```

###### 编号211
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/DuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/DuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDueSettleAmount">
		update dues set settled_amount = settled_amount + #{settleAmount},updated_at=now() where id = #{dueId}
	</update>
```

###### 编号212
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/JinmeixinInsuranceTransferRecordsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/JinmeixinInsuranceTransferRecordsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertJinmeixinInsuranceTransferRecords" keyProperty="id" parameterType="com.wolaidai.repayment.model.JinmeixinInsuranceTransferRecords" useGeneratedKeys="true">
    insert into jinmeixin_insurance_transfer_records(application_id,pay_code,transaction_seq_no,amount,due_date,created_at,updated_at)
    values(#{applicationId},#{payCode}, #{transactionSeqNo}, #{amount}, #{dueDate}, now(), now())
  </insert>
```

###### 编号213
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/JmxInsuranceFeeMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/JmxInsuranceFeeMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.repayment.model.JmxInsuranceFee">
		insert into jmx_insurance_fee (loan_id,amount,due_date,due_type,application_id,index_no,created_at)
		values (#{loanId},#{amount},#{dueDate},#{dueType},#{applicationId},#{indexNo},now())
	</insert>
```

###### 编号214
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoans" parameterType="com.wolaidai.repayment.model.Loans">
		update loans
		<set>
			<if test="state != null">
				state = #{state},
			</if>
			updated_at = now()
		</set>
		where id = #{id}
	</update>
```

###### 编号215
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/OfflineAccountsTransMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/OfflineAccountsTransMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertOfflineAccountsTrans" parameterType="com.wolaidai.repayment.model.OfflineAccountsTrans" useGeneratedKeys="true" keyProperty="id">
		insert into offline_accounts_trans(from_account_su_id, to_account_su_id, amount, state, pay_id, pay_code, created_at, updated_at)
		values(#{fromAccountSuId}, #{toAccountSuId}, #{amount}, #{state}, #{payTranId}, #{payCode}, now(), now())
	</insert>
```

###### 编号216
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/OfflineAccountsTransMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/OfflineAccountsTransMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateOfflineAccoutsTransById">
		update offline_accounts_trans
		<set>
			<if test="payTranId &gt; 0">
				pay_id =#{payTranId},
			</if>
			<if test="payCode != null">
				pay_code=#{payCode},
			</if>
			<if test="state != null">
				state = #{state},
			</if>
			updated_at = now()
		</set>
		 where id = #{id}
	</update>
```

###### 编号217
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/PayTransInfoMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/PayTransInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertPayTransInfoMapper" parameterType="com.wolaidai.repayment.model.PayTransInfo">
        insert into pay_trans_info(seq_no, third_seq_no, exch_code, state, callback_url, start_time,
        end_time, request, owner_id, owner_type, pay_code, paying_type)
        values(#{seqNo}, #{thirdSeqNo}, #{exchCode}, #{state}, #{callbackUrl}, now(),
        now(),#{request}, #{userId}, #{userType}, #{payCode}, #{payingType})
    </insert>
```

###### 编号218
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepurchaseApplication">
		update repurchase_applications
		<set>
			<if test="payTranId &gt; 0">
				pay_id =#{payTranId},
			</if>
			<if test="payCode != null">
				pay_code=#{payCode},
			</if>
			<if test="state != null">
				state = #{state},
			</if>
			updated_at = now()
		</set>
		 where id = #{id}
	</update>
```

###### 编号219
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/RiskOverduePaymentsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/RiskOverduePaymentsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRiskOverduePayments" parameterType="com.wolaidai.repayment.model.RiskOverduePayments">
        update risk_overdue_payments
        set return_principal = return_principal + #{returnPrincipal},
            return_interest = return_interest + #{returnInterest},
            updated_at = now()
        where id = #{id}

    </update>
```

###### 编号220
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/WeixinAccountsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/WeixinAccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="increaseCashBalanceAmount">
        update weixin_accounts
        set cash_balance = cash_balance + #{amount}, updated_at = now()
        where owner_id =#{userId} and owner_type = #{userType}
    </update>
```

###### 编号221
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ZantInsuranceFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ZantInsuranceFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="saveFees" parameterType="com.wolaidai.repayment.model.ZantInsuranceFees">
        insert zhongan_enhance_insurance_fee (
        application_id,index,pay_code,is_topup,amount,created_at,updated_at)
        values (#{applicationId},#{index},#{payCode},#{isTopup},
        #{amount},NOW(),NOW())
    </insert>
```

###### 编号222
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ZantInsuranceFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/repayment/blob/production/src/main/resources/mapper/ZantInsuranceFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateFees" parameterType="com.wolaidai.repayment.model.ZantInsuranceFees">
    update zhongan_enhance_insurance_fee
    <set>
    <if test="isTopup != null">
    is_topup = #{isTopup},
    </if>
    updated_at = NOW()
    </set>
    where id = #{id}
    </update>
```

###### 编号223
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.sdtrust.model.LoanTasks">
		insert into sdtrust_tasks(order_no, application_id, user_id, state, step, created_at, updated_at, credit_contract_no,partner_code)
		values(#{orderNo}, #{applicationId}, #{userId}, #{state}, #{step}, now(), now(), #{creditContractNo},#{partnerCode})
	</insert>
```

###### 编号224
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanTaskDetails" parameterType="com.wolaidai.sdtrust.model.LoanTaskDetails">
		insert into sdtrust_task_details(order_no,application_id,state,step,type,description,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{state},#{step},#{type},#{description},now(),now())
	</insert>
```

###### 编号225
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanTaskDetails" parameterType="com.wolaidai.sdtrust.model.LoanTaskDetails">
        update sdtrust_task_details
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号226
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateState">
        update sdtrust_tasks
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="step != null">
                step = #{step},
            </if>
            <if test="loanDate != null">
                loan_date = #{loanDate},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号227
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatus" parameterType="com.wolaidai.sdtrust.model.RepurchaseApplications">
    update repurchase_applications
    set status  = #{item.status}, status_dsc = #{item.statusDsc}, updated_at = now()
    where application_id = #{item.applicationId}
    </update>
```

###### 编号228
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/SdtrustLoanRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/SdtrustLoanRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.sdtrust.model.SdtrustLoanRecord">
        INSERT INTO
        sdtrust_loan_record(contract_unique_id, contract_no,partner_code,user_id, customer_order_no,
        sys_order_no,customer_detail_no, sys_detail_no,trade_create_time,complete_time,trade_status,
        balance_mark,currency,trade_amount,card_no,card_account_name,card_name,trade_no,
        bank_flow_no,oper_tag,flow_time,gateway,remark, created_at,updated_at)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.contractUniqueId},
            #{record.contractNo},
            #{record.partnerCode},
            #{record.userId},
            #{record.customerOrderNo},
            #{record.sysOrderNo},
            #{record.customerDetailNo},
            #{record.sysDetailNo},
            #{record.createTime},
            #{record.completeTime},
            #{record.tradeStatus},
            #{record.balanceMark},
            #{record.currency},
            #{record.tradeAmount},
            #{record.cardNo},
            #{record.cardAccountName},
            #{record.cardName},
            #{record.tradeNo},
            #{record.bankFlowNo},
            #{record.operTag},
            #{record.flowTime},
            #{record.gateway},
            #{record.remark},
            NOW(),
            NOW()
            )
        </foreach>
    </insert>
```

###### 编号229
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/SdtrustRepaymentRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/sdtrust-investment/blob/production/src/main/resources/mapper/SdtrustRepaymentRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.sdtrust.model.SdtrustRepaymentRecord">
        INSERT INTO
        sdtrust_repayment_record(contract_unique_id, contract_no,partner_code,user_id, deduct_id,
        order_unique_id,current_period,
        repayment_plan_no,outer_repayment_plan_no,asset_recycle_date,actual_recycle_date,
        issued_time,mark_time,loan_asset_principal,loan_asset_interest,loan_service_fee,loan_tech_fee,loan_other_fee,
        overdue_fee_penalty,overdue_fee_obligation,overdue_fee_service,overdue_fee_other,total_fee,cash_flow_type,details,
        created_at,updated_at)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.contractUniqueId},
            #{record.contractNo},
            #{record.partnerCode},
            #{record.userId},
            #{record.deductId},
            #{record.orderUniqueId},
            #{record.currentPeriod},
            #{record.repaymentPlanNo},
            #{record.outerRepaymentPlanNo},
            #{record.assetRecycleDate},
            #{record.actualRecycleDate},
            #{record.issuedTime},
            #{record.markTime},
            #{record.loanAssetPrincipal},
            #{record.loanAssetInterest},
            #{record.loanServiceFee},
            #{record.loanTechFee},
            #{record.loanOtherFee},
            #{record.overdueFeePenalty},
            #{record.overdueFeeObligation},
            #{record.overdueFeeService},
            #{record.overdueFeeOther},
            #{record.totalFee},
            #{record.cashFlowType},
            #{record.details},
            NOW(),
            NOW()
            )
        </foreach>
    </insert>
```

###### 编号230
**git地址**  
[https://git.wolaidai.com/WelabCo/TC/thirdparty-sync/blob/production/thirdparty-sync-core/src/main/resources/mapper/AnxinLoansMapper.xml](https://git.wolaidai.com/WelabCo/TC/thirdparty-sync/blob/production/thirdparty-sync-core/src/main/resources/mapper/AnxinLoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertUserLoanPurpose">
      insert into user_loan_purpose(user_id, application_id, purpose, purpose_desc, created_at, updated_at)
      values (#{userId}, #{applicationId}, #{purpose}, #{purposeDesc}, now(), now())
  </insert>
```

###### 编号231
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/tongbanjie-investment/blob/production/src/main/resources/mapper/PayTransInfoMapper.xml](https://git.wolaidai.com/WelabCo/Lender/tongbanjie-investment/blob/production/src/main/resources/mapper/PayTransInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePayTransInfo">
        update pay_trans_info set state=#{state},end_time = now() where third_seq_no=#{seqNo}
    </update>
```

###### 编号232
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/tongbanjie-investment/blob/production/src/main/resources/mapper/TongbanjieBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/tongbanjie-investment/blob/production/src/main/resources/mapper/TongbanjieBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.tongbanjieinvestment.model.TongbanjieBankCards">
    insert into tongbanjie_bank_cards(id_card,mobile,account_name,account_no,platform_no,req_data,key_serial, sign,state,ret_code,ret_msg,seq_no,created_at,updated_at)
    values(#{idCard},#{mobile},#{accountName},#{accountNo},#{platformNo},#{reqData},#{keySerial},#{sign},#{state},#{retCode},#{retMsg},#{seqNo},now(),now());
  </insert>
```

###### 编号233
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/tongbanjie-investment/blob/production/src/main/resources/mapper/TongbanjieBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/tongbanjie-investment/blob/production/src/main/resources/mapper/TongbanjieBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.tongbanjieinvestment.model.TongbanjieBankCards">
    update tongbanjie_bank_cards
    <set>
      <if test="state != null">
        state = #{state},
      </if>
      <if test="retMsg != null">
        ret_msg = #{retMsg},
      </if>
      <if test="retCode != null">
        ret_code = #{retCode},
      </if>
      <if test="accountNo != null">
      account_no = #{accountNo},
      </if>
      <if test="accountName != null">
      account_name = #{accountName},
      </if>
      <if test="idCard != null">
      id_card = #{idCard},
      </if>
      <if test="mobile != null">
      mobile = #{mobile},
      </if>
      <if test="platformNo != null">
      platform_no = #{platformNo},
      </if>
      <if test="keySerial != null">
      key_serial = #{keySerial},
      </if>
      <if test="sign != null">
      sign = #{sign},
      </if>
      <if test="reqData != null">
      req_data = #{reqData},
      </if>
        updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号234
**git地址**  
[https://git.wolaidai.com/WelabCo/Architecture/user-center/blob/production/src/main/resources/infrastructure/persistence/mapper/UserShopInfoDbMapper.xml](https://git.wolaidai.com/WelabCo/Architecture/user-center/blob/production/src/main/resources/infrastructure/persistence/mapper/UserShopInfoDbMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertUserShopInfo" parameterType="com.welab.user.domain.model.UserShopInfoEntity" useGeneratedKeys="true" keyProperty="id">
		INSERT INTO user_shop_info (
		user_id,
		tags,
		shop_platform,
		shop_name,
		shop_url,
		product_code,
		partner_code,
		income_type,
		account,
		created_at,
		updated_at,
		business_scope,
		brand_name,
		busi_name,
		industry,
		card_name,
		create_time,
		auth_model,
		auth_state
		)
		VALUES
		(
		#{userId},
		#{tags},
		#{shopPlatform},
		#{shopName},
		#{shopUrl},
		#{productCode},
		#{partnerCode},
		#{incomeType},
		#{account},
		NOW(),
		NOW(),
		#{businessScope},
		#{brandName},
		#{busiName},
		#{industry},
		#{cardName},
		#{createTime},
		#{authModel},
		#{authState}
		)
	</insert>
```

###### 编号235
**git地址**  
[https://git.wolaidai.com/WelabCo/Architecture/user-center/blob/production/src/main/resources/infrastructure/persistence/mapper/UserShopInfoDbMapper.xml](https://git.wolaidai.com/WelabCo/Architecture/user-center/blob/production/src/main/resources/infrastructure/persistence/mapper/UserShopInfoDbMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateUserShopInfo" parameterType="com.welab.user.domain.model.UserShopInfoEntity">
		UPDATE user_shop_info
		<set>
			<if test="shopPlatform != null">
				shop_platform = #{shopPlatform},
			</if>
			<if test="shopName != null">
				shop_name = #{shopName},
			</if>
			<if test="shopUrl != null">
				shop_url = #{shopUrl},
			</if>

			<if test="incomeType != null">
				income_type = #{incomeType},
			</if>
			<if test="account != null">
				account = #{account},
			</if>
			<if test="businessScope != null and businessScope!= '' ">
				business_scope = #{businessScope},
			</if>
			<if test="brandName != null and brandName!= '' ">
				brand_name = #{brandName},
			</if>
			<if test="busiName != null and busiName!= '' ">
				busi_name = #{busiName},
			</if>
			<if test="industry != null and industry!= '' ">
				industry = #{industry},
			</if>
			<if test="cardName != null and cardName!= '' ">
				card_name = #{cardName},
			</if>
			<if test="createTime != null and createTime!= '' ">
				create_time = #{createTime},
			</if>
            <if test="authModel != null and authModel!= '' ">
                auth_model = #{authModel},
            </if>
            <if test="authState != null and authState!= '' ">
                auth_state = #{authState},
            </if>
			updated_at = NOW()
		</set>
		WHERE
		user_id = #{userId}
        <if test="tags != null">
            AND tags = #{tags}
        </if>
	</update>
```

###### 编号236
**git地址**  
[https://git.wolaidai.com/WelabCo/Architecture/user-center/blob/production/src/main/resources/infrastructure/persistence/mapper/UserShopInfoDbMapper.xml](https://git.wolaidai.com/WelabCo/Architecture/user-center/blob/production/src/main/resources/infrastructure/persistence/mapper/UserShopInfoDbMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateUserShopInfoById" parameterType="com.welab.user.domain.model.UserShopInfoEntity">
        UPDATE user_shop_info
        <set>
            <if test="shopPlatform != null">
                shop_platform = #{shopPlatform},
            </if>
            <if test="shopName != null">
                shop_name = #{shopName},
            </if>
            <if test="shopUrl != null">
                shop_url = #{shopUrl},
            </if>

            <if test="incomeType != null">
                income_type = #{incomeType},
            </if>
            <if test="account != null">
                account = #{account},
            </if>
			<if test="businessScope != null and businessScope!= '' ">
				business_scope = #{businessScope},
			</if>
			<if test="brandName != null and brandName!= '' ">
				brand_name = #{brandName},
			</if>
			<if test="busiName != null and busiName!= '' ">
				busi_name = #{busiName},
			</if>
			<if test="industry != null and industry!= '' ">
				industry = #{industry},
			</if>
			<if test="cardName != null and cardName!= '' ">
				card_name = #{cardName},
			</if>
			<if test="createTime != null and createTime!= '' ">
				create_time = #{createTime},
			</if>
			<if test="authModel != null and authModel!= '' ">
				auth_model = #{authModel},
			</if>
			<if test="authState != null and authState!= '' ">
				auth_state = #{authState},
			</if>
            updated_at = NOW()
        </set>
        WHERE
        id = #{id}
    </update>
```

###### 编号237
**git地址**  
[https://git.wolaidai.com/WelabCo/Architecture/user-center/blob/production/src/main/resources/mapper/H5UserPublicAccountsMapper.xml](https://git.wolaidai.com/WelabCo/Architecture/user-center/blob/production/src/main/resources/mapper/H5UserPublicAccountsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="saveOpenId">
		INSERT INTO user_public_accounts (
			"user_id",
			"open_id",
			"platform",
			"user_status",
			"created_at",
			"updated_at"
		)
		VALUES
			(
				#{userId},
				#{openId},
				#{platform},
				#{userStatus},
				NOW(),
				NOW()
			);
	</insert>
```

###### 编号238
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.wsxmtrust.model.LoanTaskDetails">
        insert into wsxmtrust_task_details (
          order_no,user_id,application_id, step, type, description,
          status, created_at, updated_at
        ) values (
          #{orderNo,jdbcType=VARCHAR},
          #{userId},
          #{applicationId,jdbcType=VARCHAR},
          #{step,jdbcType=INTEGER}, #{type,jdbcType=VARCHAR},
          #{description,jdbcType=VARCHAR}, #{status,jdbcType=VARCHAR},
          now(), now()
        )
  </insert>
```

###### 编号239
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.wsxmtrust.model.LoanTaskDetails">
        update wsxmtrust_task_details
        <set>
            <if test="orderNo != null">
                order_no = #{orderNo},
            </if>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="request != null">
                request = #{request},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号240
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.wsxmtrust.model.LoanTasks">
        insert into wsxmtrust_tasks (order_no,application_id,capital_org_code,user_id, status,created_at, updated_at,disbursed_at) values (
          #{orderNo,jdbcType=VARCHAR},
          #{applicationId,jdbcType=VARCHAR},
          #{capitalOrgCode,jdbcType=VARCHAR},
          #{userId,jdbcType=INTEGER},
          #{status,jdbcType=VARCHAR},
          now(),
          now(),
          #{disbursedAt,jdbcType=TIMESTAMP}
        )
  </insert>
```

###### 编号241
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateState">
       update wsxmtrust_tasks set status = #{status},updated_at = now()
       where application_id = #{applicationId}
    </update>
```

###### 编号242
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.wsxmtrust.model.LoanTasks">
        update wsxmtrust_tasks
        <set>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="capitalOrgCode != null">
                capital_org_code = #{capitalOrgCode},
            </if>
            <if test="disbursedAt != null">
                disbursed_at =#{disbursedAt},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号243
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustBanksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustBanksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustBanks">
        insert into wsxmtrust_banks (bank_code,bank_name,bank_no,logo_url,created_at, updated_at) values (
          #{bankCode,jdbcType=VARCHAR},
          #{bankName,jdbcType=VARCHAR},
          #{bankNo},
          #{logoUrl},
          now(),
          now()
        )
  </insert>
```

###### 编号244
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustBanksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustBanksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustBanks">
        insert into wsxmtrust_banks (bank_code,bank_name,bank_no,logo_url,created_at, updated_at)
        values
        <foreach collection="list" item="item" index="index" separator=",">
            (#{item.bankCode,jdbcType=VARCHAR},
            #{item.bankName,jdbcType=VARCHAR},
            #{item.bankNo},
            #{item.logoUrl},
            now(),
            now()
            )
        </foreach>
    </insert>
```

###### 编号245
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert">
        insert into wsxmtrust_dues(application_id,due_index,due_date,principal,interest,server_fee,
        is_fault,is_fixed,fix_due_type,created_at,updated_at )
        values
        <foreach collection="list" item="item" index="index" separator=",">
            (#{item.applicationId},#{item.dueIndex},#{item.dueDate},#{item.principal},#{item.interest},#{item.serverFee},
            #{item.isFault},0,#{item.fixDueType},now(),now())
        </foreach>
    </insert>
```

###### 编号246
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustGuaranteeFeeRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustGuaranteeFeeRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustGuaranteeFeeRecord">
        insert into wsxmtrust_guarantee_fee_record (order_no, amount, application_id, due_date, repay_date, repay_amount, created_at, updated_at)
        values (
	#{orderNo,jdbcType=VARCHAR},
	#{amount,jdbcType=NUMERIC},
	#{applicationId,jdbcType=VARCHAR},
	#{dueDate,jdbcType=DATE},
	#{repayDate,jdbcType=DATE},
	#{repayAmount,jdbcType=NUMERIC},
          now(),
          now()
        )
  </insert>
```

###### 编号247
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustGuaranteeFeeRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustGuaranteeFeeRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustGuaranteeFeeRecord">
        insert into wsxmtrust_guarantee_fee_record (order_no, amount, application_id, due_date, repay_date, repay_amount, created_at, updated_at)
        values
        <foreach collection="list" item="item" index="index" separator=",">
            (
	#{item.orderNo,jdbcType=VARCHAR},
	#{item.amount,jdbcType=NUMERIC},
	#{item.applicationId,jdbcType=VARCHAR},
	#{item.dueDate,jdbcType=DATE},
	#{item.repayDate,jdbcType=DATE},
	#{item.repayAmount,jdbcType=NUMERIC},
          now(),
          now()
            )
        </foreach>
    </insert>
```

###### 编号248
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustRepayRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustRepayRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustRepayRecord">
        insert into wsxmtrust_repay_record (order_no, amount, application_id, period, index, due_date, principal, interest, repay_date, repay_principal, repay_interest, created_at, updated_at)
        values (
	#{orderNo,jdbcType=VARCHAR},
	#{amount,jdbcType=NUMERIC},
	#{applicationId,jdbcType=VARCHAR},
	#{period,jdbcType=INTEGER},
	#{index,jdbcType=INTEGER},
	#{dueDate,jdbcType=DATE},
	#{principal,jdbcType=NUMERIC},
	#{interest,jdbcType=NUMERIC},
	#{repayDate,jdbcType=DATE},
	#{repayPrincipal,jdbcType=NUMERIC},
	#{repayInterest,jdbcType=NUMERIC},
          now(),
          now()
        )
  </insert>
```

###### 编号249
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustRepayRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustRepayRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustRepayRecord">
        insert into wsxmtrust_repay_record (order_no, amount, application_id, period, index, due_date, principal, interest, repay_date, repay_principal, repay_interest, created_at, updated_at)
        values
        <foreach collection="list" item="item" index="index" separator=",">
            (
	#{item.orderNo,jdbcType=VARCHAR},
	#{item.amount,jdbcType=NUMERIC},
	#{item.applicationId,jdbcType=VARCHAR},
	#{item.period,jdbcType=INTEGER},
	#{item.index,jdbcType=INTEGER},
	#{item.dueDate,jdbcType=DATE},
	#{item.principal,jdbcType=NUMERIC},
	#{item.interest,jdbcType=NUMERIC},
	#{item.repayDate,jdbcType=DATE},
	#{item.repayPrincipal,jdbcType=NUMERIC},
	#{item.repayInterest,jdbcType=NUMERIC},
          now(),
          now()
            )
        </foreach>
    </insert>
```

###### 编号250
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustTransactions">
    insert into wsxmtrust_transactions (user_id,application_id,due_index,service_no,loan_book_no,order_no,is_batch,
                amount,principal_interest_status,server_fee_status,status,repay_mode,debit_source,
                repay_type,principal,interest,server_fee,request,response1,response2,created_at,updated_at)
    values (#{userId},#{applicationId},#{dueIndex},#{serviceNo},#{loanBookNo},#{orderNo},#{isBatch},
        #{amount},#{principalInterestStatus},#{serverFeeStatus}, #{status},#{repayMode},
        #{debitSource},#{repayType},#{principal},#{interest},#{serverFee},#{request},#{response1},#{response2},now(),now())
  </insert>
```

###### 编号251
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustTransactions">
        update wsxmtrust_transactions
        <set>
            <if test="principalInterestStatus != null">
                principal_interest_status = #{principalInterestStatus},
            </if>
            <if test="serverFeeStatus != null">
                server_fee_status = #{serverFeeStatus},
            </if>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            <if test="response1 != null">
                response1 = #{response1},
            </if>
            <if test="response2 != null">
                response2 = #{response2},
            </if>
            updated_at = now()
        </set>
        where id = #{id,jdbcType=INTEGER}
    </update>
```

###### 编号252
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePricipalPart" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustTransactions">
        update wsxmtrust_transactions
        <set>
            <if test="principal != null">
                principal= #{principal},
            </if>
            <if test="interest!= null">
                interest = #{interest},
            </if>
            <if test="response1 != null">
                response1 = #{response1},
            </if>
            <if test="principalInterestStatus != null">
                principal_interest_status = #{principalInterestStatus},
            </if>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="amount != null">
                amount = #{amount},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where id = #{id,jdbcType=INTEGER}
    </update>
```

###### 编号253
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateServerFeePart" parameterType="com.wolaidai.wsxmtrust.model.WsxmtrustTransactions">
        update wsxmtrust_transactions
        <set>
            <if test="serverFee!= null">
                server_fee= #{serverFee},
            </if>
            <if test="response2 != null">
                response2 = #{response2},
            </if>
            <if test="serverFeeStatus != null">
                server_fee_status = #{serverFeeStatus},
            </if>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            <if test="amount != null">
                amount = #{amount},
            </if>
            updated_at = now()
        </set>
        where id = #{id,jdbcType=INTEGER}
    </update>
```

###### 编号254
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatus">
      update wsxmtrust_transactions set status = #{status},updated_at = now() where service_no = #{serviceNo}
    </update>
```

###### 编号255
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/wangshang-xmtrust-investment/blob/production/src/main/resources/mapper/WsxmtrustTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateOfflineRepays">
     UPDATE wsxmtrust_transactions set status ='succeed',updated_at = now() WHERE debit_source = 'offline'
     and status ='processing'
    </update>
```

###### 编号256
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/wechat-channel/blob/production/src/main/resources/mapper/AccountsSuMapper.xml](https://git.wolaidai.com/WelabCo/Finance/wechat-channel/blob/production/src/main/resources/mapper/AccountsSuMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertAccountsSu">
        insert into accounts_su(account_id, owner_id, owner_type, pay_code, balance, cash_balance,
        freeze_balance, withdraw_balance, created_at, updated_at)
        values(#{accountId},#{ownerId},#{ownerType},#{payCode}, 0.00, 0.00, 0.00, 0.00, now(),
        now())
    </insert>
```

###### 编号257
**git地址**  
[https://git.wolaidai.com/WelabCo/Finance/wechat-channel/blob/production/src/main/resources/mapper/WechatTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Finance/wechat-channel/blob/production/src/main/resources/mapper/WechatTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePayTransInfo">
        update pay_trans_info set state=#{state},end_time = now() where third_seq_no=#{seqNo} and pay_code = #{payCode}
  </update>
```

###### 编号258
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanContractCode">
        update loan_procedures
        <set>
            <if test="contractCode != null">
                contract_code = #{contractCode},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号259
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/UpdatePrincipalDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/UpdatePrincipalDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateWsmDues" parameterType="map">
	 update weishenma_dues set amount= (amount + (#{amount}) ),updated_at= now()
	 where application_id  = #{applicationId}
         and  due_index =#{index}
          and due_type = 'principal'
	</update>
```

###### 编号260
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/WeishenmaAdvanceSettleListMapper.xml](https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/WeishenmaAdvanceSettleListMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.welab.weishenma.model.WeishenmaAdvanceSettleList">
        INSERT INTO
        weishenma_advance_settle_list(application_id, NAME,loan_account,id_num, loan_amount,
        contract_start_date,contract_end_date, customer_repayment_date,bank_loan_date,bank_end_date,bank_repayment_date,
        customer_repayment_principal,customer_repayment_interest,total_customer_repayment,bank_repayment_principal,bank_repayment_interest,bank_repayment_total,recycling_method,
        asset_number,merchant_order_num,index_no,partner_code,created_at, updated_at,type)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.applicationId},
            #{record.name},
            #{record.loanAccount},
            #{record.idNum},
            #{record.loanAmount},
            #{record.contractStartDate},
            #{record.contractEndDate},
            #{record.customerRepaymentDate},
            #{record.bankLoanDate},
            #{record.bankEndDate},
            #{record.bankRepaymentDate},
            #{record.customerRepaymentPrincipal},
            #{record.customerRepaymentInterest},
            #{record.totalCustomerRepayment},
            #{record.bankRepaymentPrincipal},
            #{record.bankRepaymentInterest},
            #{record.bankRepaymentTotal},
            #{record.recyclingMethod},
            #{record.assetNumber},
            #{record.merchantOrderNum},
            #{record.indexNo},
            #{record.partnerCode},
            #{record.createdAt},
            NOW(),
            #{record.type}
            )
        </foreach>
    </insert>
```

###### 编号261
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/WeishenmaSettlementRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/WeishenmaSettlementRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertRecord" parameterType="com.welab.weishenma.model.WeishenmaSettlementRecord">
        INSERT INTO weishenma_settlement_record(settlement_date,total_amount_payable,loans_due_num,amount_due_payable,advance_settle_amount,repurchase_settlement_amount,current_date_real,created_at,updated_at)
        VALUES (
          #{record.settlementDate},
          #{record.totalAmountPayable},
          #{record.loansDueNum},
          #{record.amountDuePayable},
          #{record.advanceSettleAmount},
          #{record.repurchaseSettlementAmount},
          #{record.currentDateReal},
          NOW(),
          NOW()
        )
    </insert>
```

###### 编号262
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/WeishenmaSettlementRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/WeishenmaSettlementRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRecord">
UPDATE weishenma_settlement_record
SET total_amount_payable = total_amount_payable + #{totalAmount},
 advance_settle_amount = advance_settle_amount + #{settleAmount},
 repurchase_settlement_amount = repurchase_settlement_amount + #{repurchaseAmount},
 updated_at = now()
WHERE
	ID = #{id}

    </update>
```

###### 编号263
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/WeishenmaSettlementRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/weishenma-investment/blob/production/src/main/resources/mapper/WeishenmaSettlementRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePayableRecord">
UPDATE weishenma_settlement_record
SET total_amount_payable = total_amount_payable - #{amountDuePayable},
 loans_due_num = loans_due_num - #{loanDueNum},
 amount_due_payable = amount_due_payable - #{amountDuePayable},
 updated_at = now()
WHERE
	ID = #{id}

    </update>
```

###### 编号264
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanExtensionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanExtensionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanExtensions">
       update loan_extensions set state = 'succeed',updated_at = now() where id = #{id}
    </update>
```

###### 编号265
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.model.LoanTasks">
		insert into yntrust_tasks(order_no,application_id,user_id,state,step,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{userId},#{state},#{step},now(),now())
	</insert>
```

###### 编号266
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanTaskDetails" parameterType="com.wolaidai.yntrust.model.LoanTaskDetails">
		insert into yntrust_task_details(order_no,application_id,state,step,type,description,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{state},#{step},#{type},#{description},now(),now())
	</insert>
```

###### 编号267
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanTaskDetails" parameterType="com.wolaidai.yntrust.model.LoanTaskDetails">
        update yntrust_task_details
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号268
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update41RetCodeByOrderNo" parameterType="com.wolaidai.yntrust.model.LoanTaskDetails">
        update yntrust_task_details
        <set>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            updated_at = now()
        </set>
        where order_no = #{orderNo} and step = 41
    </update>
```

###### 编号269
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateState">
        update yntrust_tasks
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="step != null">
                step = #{step},
            </if>
            <if test="loanDate != null">
                loan_date = #{loanDate},
            </if>
            updated_at = now()
        </set>
        where order_no = #{orderNo}
    </update>
```

###### 编号270
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDocumentsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDocumentsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertYntrustDoc" parameterType="com.wolaidai.yntrust.model.YntrustDocuments">
        insert into yntrust_documents(order_no,user_id,application_id,doc_type,doc_url,remark,created_at,updated_at)
        values(#{orderNo},#{userId},#{applicationId},#{docType},#{docUrl},#{remark},now(),now())
    </insert>
```

###### 编号271
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.model.YntrustDues">
        insert into yntrust_dues(order_no,user_id,application_id,repay_date,principal,interest,yntrust_due_no,created_at,updated_at,due_id,due_index)
        values(#{orderNo},#{userId},#{applicationId},#{repayDate},#{principal},#{interest},#{yntrustDueNo},now(),now(),#{dueId},#{dueIndex})
    </insert>
```

###### 编号272
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert">
        insert into yntrust_dues(order_no,user_id,application_id,repay_date,principal,interest,yntrust_due_no,created_at,updated_at,due_id,due_index)
        values
        <foreach collection="list" item="item" index="index" separator=",">
          (#{item.orderNo},#{item.userId},#{item.applicationId},#{item.repayDate},#{item.principal},#{item.interest},#{item.yntrustDueNo},now(),now(),#{item.dueId},#{item.dueIndex})
        </foreach>
    </insert>
```

###### 编号273
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateYntrustDues" parameterType="com.wolaidai.yntrust.model.YntrustDues">
        update YNTRUST_DUES
        <set>
            <if test="interest != null">
                interest = #{interest},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号274
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateYntrustDuesAll" parameterType="com.wolaidai.yntrust.model.YntrustDues">
        update YNTRUST_DUES
        <set>
            interest = #{interest},
            principal = #{principal},
            yntrust_due_no = #{yntrustDueNo},
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号275
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustPaymentDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-investment/blob/production/src/main/resources/mapper/YntrustPaymentDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.entity.PaymentDetail">
        insert into yntrust_dues(order_no,detail_no,account_no,name,bank_serial_no,amount,process_status,result,act_excuted_time,created_at,updated_at)
        values(#{orderNo},#{detailNo},#{accountNo},#{name},#{bankSerialNo},#{amount},#{processStatus},#{result},#{actExcutedTime},now(),now())
    </insert>
```

###### 编号276
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.model.LoanTasks">
		insert into yntrust_project1_tasks(order_no, application_id, user_id, state, step, created_at, updated_at, credit_contract_no)
		values(#{orderNo}, #{applicationId}, #{userId}, #{state}, #{step}, now(), now(), #{creditContractNo})
	</insert>
```

###### 编号277
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanTaskDetails" parameterType="com.wolaidai.yntrust.model.LoanTaskDetails">
		insert into yntrust_project1_task_details(order_no,application_id,state,step,type,description,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{state},#{step},#{type},#{description},now(),now())
	</insert>
```

###### 编号278
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanTaskDetails" parameterType="com.wolaidai.yntrust.model.LoanTaskDetails">
        update yntrust_project1_task_details
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号279
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateState">
        update yntrust_project1_tasks
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="step != null">
                step = #{step},
            </if>
            <if test="loanDate != null">
                loan_date = #{loanDate},
            </if>
            updated_at = now()
        </set>
        where order_no = #{orderNo}
    </update>
```

###### 编号280
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustAccountMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustAccountMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.yntrust.model.YntrustAccount">
    update yntrust_project1_account
    set
    <if test="balance != null and balance != '' ">
      balance = #{balance,jdbcType=NUMERIC},
    </if>
    <if test="queryDateTime != null ">
      query_date_time = #{queryDateTime,jdbcType=TIMESTAMP},
    </if>
    <if test="releaseBalance != null and releaseBalance != '' ">
      release_balance = #{releaseBalance,jdbcType=NUMERIC},
    </if>
    <if test="queryBalanceDateTime != null ">
      query_balance_date_time = #{queryBalanceDateTime,jdbcType=TIMESTAMP},
    </if>
    <if test="enabled != null and enabled != '' ">
      enabled = #{enabled,jdbcType=BOOLEAN},
    </if>
    <if test="canPay != null and canPay != '' ">
      canPay = #{canPay,jdbcType=BOOLEAN},
    </if>
    updated_at = now()
    where id = #{id,jdbcType=INTEGER}
  </update>
```

###### 编号281
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDocumentsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDocumentsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertYntrustDoc" parameterType="com.wolaidai.yntrust.model.YntrustDocuments">
        insert into yntrust_documents(order_no, user_id, application_id, doc_type, doc_url, remark, created_at, updated_at)
        values(#{orderNo}, #{userId}, #{applicationId}, #{docType}, #{docUrl}, #{remark}, now(), now())
    </insert>
```

###### 编号282
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.model.YntrustDues">
        insert into yntrust_project1_dues(order_no,user_id,application_id,repay_date,principal,interest,yntrust_due_no,created_at,updated_at,due_id,due_index)
        values(#{orderNo},#{userId},#{applicationId},#{repayDate},#{principal},#{interest},#{yntrustDueNo},now(),now(),#{dueId},#{dueIndex})
    </insert>
```

###### 编号283
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert">
        insert into yntrust_project1_dues(order_no,user_id,application_id,repay_date,principal,interest,yntrust_due_no,created_at,updated_at,due_id,due_index)
        values
        <foreach collection="list" item="item" index="index" separator=",">
          (#{item.orderNo},#{item.userId},#{item.applicationId},#{item.repayDate},#{item.principal},#{item.interest},#{item.yntrustDueNo},now(),now(),#{item.dueId},#{item.dueIndex})
        </foreach>
    </insert>
```

###### 编号284
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateYntrustDues" parameterType="com.wolaidai.yntrust.model.YntrustDues">
        update yntrust_project1_dues
        <set>
            <if test="interest != null">
                interest = #{interest},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号285
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateYntrustDuesAll" parameterType="com.wolaidai.yntrust.model.YntrustDues">
        update yntrust_project1_dues
        <set>
            interest = #{interest},
            principal = #{principal},
            yntrust_due_no = #{yntrustDueNo},
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号286
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustMutableFeeMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustMutableFeeMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.yntrust.model.YntrustMutableFee">
			update yntrust_project1_mutable_fee
			set
			<if test="status != null and status != '' ">
				status = #{status},
			</if>
			<if test="retCode != null and retCode != '' ">
				ret_code = #{retCode},
			</if>
			<if test="retMsg != null and retMsg != '' ">
				ret_msg = #{retMsg},
			</if>
			updated_at = now()
			where id = #{id,jdbcType=INTEGER}
		</update>
```

###### 编号287
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustPaymentDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustPaymentDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.entity.PaymentDetail">
        insert into yntrust_dues(order_no,detail_no,account_no,name,bank_serial_no,amount,process_status,result,act_excuted_time,created_at,updated_at)
        values(#{orderNo},#{detailNo},#{accountNo},#{name},#{bankSerialNo},#{amount},#{processStatus},#{result},#{actExcutedTime},now(),now())
    </insert>
```

###### 编号288
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustProfitFeeMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustProfitFeeMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.yntrust.model.YntrustProfitFee">
			update yntrust_project1_fee
			set
			<if test="interestProfit != null and interestProfit != '' ">
				interest_profit = #{interestProfit},
			</if>
			<if test="investorProfit != null and investorProfit != '' ">
				investor_profit = #{investorProfit},
			</if>
			<if test="trustManageFee != null and trustManageFee != '' ">
				trust_manage_fee = #{trustManageFee},
			</if>
			<if test="bankManageFee != null and bankManageFee != '' ">
				bank_manage_fee = #{bankManageFee},
			</if>
			<if test="bankMutableFee != null and bankMutableFee != '' ">
				bank_mutable_fee = #{bankMutableFee},
			</if>
			<if test="wldManageFee != null and wldManageFee != '' ">
				wld_manage_fee = #{wldManageFee},
			</if>
			<if test="repayWithholdFee != null and repayWithholdFee != '' ">
				repay_withhold_fee = #{repayWithholdFee},
			</if>
			<if test="identityValidFee != null and identityValidFee != '' ">
				identity_valid_fee = #{identityValidFee},
			</if>
			<if test="taxFee != null and taxFee != '' ">
				tax_fee = #{taxFee},
			</if>
			<if test="stampTax != null and stampTax != '' ">
				stamp_tax = #{stampTax},
			</if>
			<if test="other1Fee != null and other1Fee != '' ">
				other1_fee = #{other1Fee},
			</if>
			<if test="other2Fee != null and other2Fee != '' ">
				other2_fee = #{other2Fee},
			</if>
			<if test="other3Fee != null and other3Fee != '' ">
				other3_fee = #{other3Fee},
			</if>
			<if test="totalFee != null and totalFee != '' ">
				total_fee = #{totalFee},
			</if>
			updated_at = now()
			where id = #{id,jdbcType=INTEGER} and profit_date = #{profitDate,jdbcType=VARCHAR}
		</update>
```

###### 编号289
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustRepayPushBatchMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustRepayPushBatchMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatus">
			update yntrust_project1_repay_push_batch
			set
			status = #{status},
			updated_at = now()
			where id = #{id}
		</update>
```

###### 编号290
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project1-investment/blob/production/src/main/resources/mapper/YntrustTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateYntrustTransactions" parameterType="com.wolaidai.yntrust.model.YntrustTransactions">
			update yntrust_project1_transactions
			set
			<if test="status != null and status != '' ">
				status = #{status,jdbcType=VARCHAR},
			</if>
			<if test="batchNo != null and batchNo != '' ">
				batch_no = #{batchNo,jdbcType=VARCHAR},
			</if>
			<if test="retCode != null and retCode != '' ">
				ret_code = #{retCode,jdbcType=VARCHAR},
			</if>
			<if test="retMsg != null and retMsg != '' ">
				ret_msg = #{retMsg,jdbcType=VARCHAR},
			</if>
			<if test="response != null and response != '' ">
				response = #{response,jdbcType=VARCHAR},
			</if>
			<if test="repayAt != null ">
				repay_at = #{repayAt,jdbcType=DATE},
			</if>
			updated_at = now()
			where id = #{id,jdbcType=INTEGER}
		</update>
```

###### 编号291
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.model.LoanTasks">
		insert into yntrust_project2_tasks(order_no, application_id, user_id, state, step, created_at, updated_at, credit_contract_no,partner_code)
		values(#{orderNo}, #{applicationId}, #{userId}, #{state}, #{step}, now(), now(), #{creditContractNo},#{partnerCode})
	</insert>
```

###### 编号292
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertLoanTaskDetails" parameterType="com.wolaidai.yntrust.model.LoanTaskDetails">
		insert into yntrust_project2_task_details(order_no,application_id,state,step,type,description,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{state},#{step},#{type},#{description},now(),now())
	</insert>
```

###### 编号293
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanTaskDetails" parameterType="com.wolaidai.yntrust.model.LoanTaskDetails">
        update yntrust_project2_task_details
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号294
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/LoanTasksMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateState">
        update yntrust_project2_tasks
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="step != null">
                step = #{step},
            </if>
            <if test="loanDate != null">
                loan_date = #{loanDate},
            </if>
            updated_at = now()
        </set>
        where order_no = #{orderNo}
    </update>
```

###### 编号295
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustDocumentsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustDocumentsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertYntrustDoc" parameterType="com.wolaidai.yntrust.model.YntrustDocuments">
        insert into yntrust_documents(order_no, user_id, application_id, doc_type, doc_url, remark, created_at, updated_at)
        values(#{orderNo}, #{userId}, #{applicationId}, #{docType}, #{docUrl}, #{remark}, now(), now())
    </insert>
```

###### 编号296
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.model.YntrustDues">
        insert into yntrust_project2_dues(order_no,user_id,application_id,repay_date,principal,interest,yntrust_due_no,created_at,updated_at,due_id,due_index)
        values(#{orderNo},#{userId},#{applicationId},#{repayDate},#{principal},#{interest},#{yntrustDueNo},now(),now(),#{dueId},#{dueIndex})
    </insert>
```

###### 编号297
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert">
        insert into
        yntrust_project2_dues(order_no,user_id,application_id,repay_date,principal,interest,yntrust_due_no,created_at,updated_at,due_id,due_index)
        values
        <foreach collection="list" item="item" index="index" separator=",">
            (#{item.orderNo},#{item.userId},#{item.applicationId},#{item.repayDate},#{item.principal},#{item.interest},#{item.yntrustDueNo},now(),now(),#{item.dueId},#{item.dueIndex})
        </foreach>
    </insert>
```

###### 编号298
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustPaymentDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustPaymentDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.entity.PaymentDetail">
        insert into yntrust_dues(order_no,detail_no,account_no,name,bank_serial_no,amount,process_status,result,act_excuted_time,created_at,updated_at)
        values(#{orderNo},#{detailNo},#{accountNo},#{name},#{bankSerialNo},#{amount},#{processStatus},#{result},#{actExcutedTime},now(),now())
    </insert>
```

###### 编号299
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustTransactonsBatchMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustTransactonsBatchMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.model.YntrustTransactionsBatch">
        insert into yntrust_project2_transactions_batch(transaction_no,partner_code,debit_source,pay_date,
        amount,status,created_at,updated_at)
         VALUES (#{transactionNo},#{partnerCode},#{debitSource},#{payDate},
         #{amount},#{status},now(),now())
    </insert>
```

###### 编号300
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustTransactonsBatchMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustTransactonsBatchMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update">
        update yntrust_project2_transactions_batch
        <set>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            <if test="request != null">
                request = #{request},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号301
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustTransactonsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustTransactonsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yntrust.model.YntrustTransactions">
        insert into yntrust_project2_transactions(partner_code,transaction_no,user_id,order_no,application_id,service_no,pay_date,
        debit_source,action,due_index,yntrust_due_no,amount,principal,interest,
        status,request,created_at,updated_at)
         VALUES (#{partnerCode},#{transactionNo},#{userId},#{orderNo},#{applicationId},#{serviceNo},#{payDate},
         #{debitSource},#{action},#{dueIndex},#{yntrustDueNo},#{amount},#{principal},#{interest},
         #{status},#{request},now(),now())
    </insert>
```

###### 编号302
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustTransactonsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yntrust-project2-investment/blob/production/src/main/resources/mapper/YntrustTransactonsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateBytransactionNo">
        update yntrust_project2_transactions set status = #{status},updated_at = now()
        where transaction_no = #{transactionNo}
    </update>
```

###### 编号303
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/LoanTaskDetailsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateByType">
    update yooli_task_details
    <set>
      <if test="step != null">
        step = #{step},
      </if>
      <if test="description != null">
        description = #{description},
      </if>
      <if test="state != null">
        state = #{state},
      </if>
      <if test="retCode != null">
        ret_code = #{retCode},
      </if>
      <if test="retMsg != null">
        ret_msg = #{retMsg},
      </if>
      updated_at = now()
    </set>
    where application_id = #{applicationId}
    and type = #{type}
  </update>
```

###### 编号304
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateState">
    update yooli_tasks
    <set>
      <if test="state != null">
        state = #{state},
      </if>
      updated_at = now()
    </set>
    where application_id = #{applicationId}
  </update>
```

###### 编号305
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/LoanTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStateAndDisbursedAt">
    update yooli_tasks
    set state = #{state},
      disbursed_at = #{loanTime},
      updated_at = now()
    where application_id = #{applicationId}
  </update>
```

###### 编号306
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepayTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepayTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayTransactionsState">
		update yooli_transactions
		<set>
			<if test="applicationId != null">
                application_id = #{applicationId},
			</if>
			<if test="seqNo != null">
                seq_no = #{seqNo},
			</if>
            <if test="seriodId != null">
                seriod_id = #{seriodId},
            </if>
			<if test="repayAmount != null">
				repay_amount = #{repayAmount},
			</if>
			<if test="couponAmount != null">
				coupon_amount = #{couponAmount},
			</if>
            <if test="offlineAmount != null">
                offline_amount = #{offlineAmount},
            </if>
            <if test="settleIndex != null">
                settle_index = #{settleIndex},
            </if>
            <if test="repayType != null">
                repay_type = #{repayType},
            </if>
            <if test="repayModel != null">
                repay_model = #{repayModel},
            </if>
            <if test="debitSource != null">
                debit_source = #{debitSource},
            </if>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="reduceStatus != null">
                reduce_status = #{reduceStatus},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            <if test="request != null">
                request = #{request},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            <if test="createdAt != null">
                created_at = #{createdAt},
            </if>
			updated_at = now()
		</set>
		where id = #{id}
	</update>
```

###### 编号307
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepayTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepayTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayTransactionsStateList" parameterType="java.util.List">
		update yooli_transactions
		<set>
            <if test="status != null">
                status = #{status},
            </if>
			updated_at = now()
		</set>
		where id in
      <foreach collection="transactionsList" item="transaction" index="index" open="(" close=")" separator=",">
           #{transaction.id}
        </foreach>
	</update>
```

###### 编号308
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepurchaseApplicationByCondition">
    update repurchase_applications set status  = #{status}, status_dsc = #{statusDsc}, updated_at = now()
    where application_id = #{applicationId}
    </update>
```

###### 编号309
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateYooliPrincipalInterest">
    update repurchase_applications
    set real_principal = #{realPrincipal}, real_interest = #{realInterest},  updated_at = now()
    where application_id = #{applicationId}
    </update>
```

###### 编号310
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsertYooliRepurchase">
        insert into yooli_risk_repurchase
        (order_id,external_order_id,period,amount,principle,interest,overdue_penalty,penalty,handling_fee,collect_date,repay_model,created_at,updated_at)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.orderId},
            #{record.externalOrderId},
            #{record.period},
            #{record.amount},
            #{record.principle},
            #{record.interest},
            #{record.overduePenalty},
            #{record.penalty},
            #{record.handlingFee},
            #{record.collectDate},
            #{record.repayModel},
            now(),
            now()
            )
        </foreach>
    </insert>
```

###### 编号311
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/YooliBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/YooliBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.yooli.model.YooliBankCards">
    insert into yooli_bank_cards(id_card,mobile,account_name,account_no,signing_biz_id,state,ret_code,ret_msg,seq_no,created_at,updated_at)
    values(#{idCard},#{mobile},#{accountName},#{accountNo},#{signingBizID},#{state},#{retCode},#{retMsg},#{seqNo},now(),now());
  </insert>
```

###### 编号312
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/YooliBankCardsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/YooliBankCardsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.yooli.model.YooliBankCards">
    update yooli_bank_cards
    <set>
      <if test="state != null">
        state = #{state},
      </if>
      <if test="retMsg != null">
        ret_msg = #{retMsg},
      </if>
      <if test="retCode != null">
        ret_code = #{retCode},
      </if>
        updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号313
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/YooliRiskAdvancesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/yooli-investment/blob/production/src/main/resources/mapper/YooliRiskAdvancesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="java.util.List">
        insert into yooli_risk_advances
        (order_id,external_order_id,period,amount,principle,interest,overdue_penalty,penalty,handling_fee,collect_date,repay_model,created_at,updated_at)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.orderId},
            #{record.externalOrderId},
            #{record.period},
            #{record.amount},
            #{record.principle},
            #{record.interest},
            #{record.overduePenalty},
            #{record.penalty},
            #{record.handlingFee},
            #{record.collectDate},
            #{record.repayModel},
            now(),
            now()
            )
        </foreach>
    </insert>
```

###### 编号314
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/ReimbursesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/ReimbursesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateReimburses" parameterType="com.wolaidai.zbbank.model.RepayTransactions">
    update zbbank_reimburses
    set
    <if test="requestNo != null and requestNo != '' ">
      request_no = #{requestNo,jdbcType=VARCHAR},
    </if>
    <if test="status != null and status != '' ">
      status = #{status,jdbcType=VARCHAR},
    </if>
    <if test="retCode != null and retCode != '' ">
      ret_code = #{retCode,jdbcType=VARCHAR},
    </if>
    <if test="retMsg != null and retMsg != '' ">
      ret_msg = #{retMsg,jdbcType=VARCHAR},
    </if>
    <if test="repayAt != null ">
      repay_at = #{repayAt,jdbcType=DATE},
    </if>
    updated_at = now()
    where id = #{id,jdbcType=INTEGER}
  </update>
```

###### 编号315
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/RepayTransactionMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/RepayTransactionMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayTransactions" parameterType="com.wolaidai.zbbank.model.RepayTransactions">
    update zbbank_transactions
    set
    <if test="requestNo != null and requestNo != '' ">
      request_no = #{requestNo,jdbcType=VARCHAR},
    </if>
    <if test="status != null and status != '' ">
      status = #{status,jdbcType=VARCHAR},
    </if>
    <if test="retCode != null and retCode != '' ">
      ret_code = #{retCode,jdbcType=VARCHAR},
    </if>
    <if test="retMsg != null and retMsg != '' ">
      ret_msg = #{retMsg,jdbcType=VARCHAR},
    </if>
    <if test="repayAt != null ">
      repay_at = #{repayAt,jdbcType=DATE},
    </if>
    updated_at = now()
    where id = #{id,jdbcType=INTEGER}
  </update>
```

###### 编号316
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatus" parameterType="com.wolaidai.zbbank.model.RepurchaseApplications">
    update repurchase_applications
    set status  = #{item.status}, status_dsc = #{item.statusDsc}, updated_at = now()
    where application_id = #{item.applicationId}
    </update>
```

###### 编号317
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/ZbbankReimburseRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/ZbbankReimburseRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.zbbank.model.ZbbankReimburseRecord">
    update zbbank_reimburse_record
    set
    <if test="seqNo != null and seqNo != '' ">
      seq_no = #{requestNo,jdbcType=VARCHAR},
    </if>
    <if test="orderNo != null and orderNo != '' ">
      order_no = #{orderNo,jdbcType=VARCHAR},
    </if>
    <if test="reimburseAmount != null">
      reimburse_amount = #{reimburseAmount,jdbcType=NUMERIC},
    </if>
    <if test="principal != null ">
      principal = #{principal,jdbcType=NUMERIC},
    </if>
     <if test="interest != null ">
      interest = #{interest,jdbcType=NUMERIC},
    </if>
     <if test="penalty != null ">
      penalty = #{penalty,jdbcType=NUMERIC},
    </if>
    <if test="compound != null ">
      compound = #{compound,jdbcType=NUMERIC},
    </if>
    <if test="loanDate != null ">
      loan_date = #{loanDate,jdbcType=DATE},
    </if>
    <if test="overdays != null ">
      overdays = #{overdays,jdbcType=INTEGER},
    </if>
    <if test="index != null ">
      index = #{index,jdbcType=INTEGER},
    </if>
    <if test="repaySign != null ">
      repay_sign = #{repaySign,jdbcType=INTEGER},
    </if>
    <if test="status != null and status != '' ">
      status = #{status,jdbcType=VARCHAR},
    </if>
    <if test="failedReason != null and failedReason != '' ">
      failed_reason = #{failedReason,jdbcType=VARCHAR},
    </if>
     <if test="bizDate != null ">
      biz_date = #{bizDate,jdbcType=DATE},
    </if>
    updated_at = now()
    where id = #{id,jdbcType=INTEGER}
  </update>
```

###### 编号318
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/ZbbankRepayRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/ZbbankRepayRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.zbbank.model.ZbbankRepayRecord">
    update zbbank_repay_record
    set
    <if test="seqNo != null and seqNo != '' ">
      seq_no = #{seqNo,jdbcType=VARCHAR},
    </if>
    <if test="thirdRepaySeq != null and thirdRepaySeq != '' ">
      third_repay_seq = #{thirdRepaySeq,jdbcType=VARCHAR},
    </if>
    <if test="orderNo != null and orderNo != '' ">
      order_no = #{orderNo,jdbcType=VARCHAR},
    </if>
     <if test="settledAt != null">
      settled_at = #{settledAt,jdbcType=TIMESTAMP},
    </if>
    <if test="settledAmount != null">
      settled_amount = #{settledAmount,jdbcType=NUMERIC},
    </if>
    <if test="status != null and status != '' ">
      status = #{status,jdbcType=VARCHAR},
    </if>
    <if test="index != null ">
      index = #{index,jdbcType=INTEGER},
    </if>
    <if test="principal != null ">
      principal = #{principal,jdbcType=NUMERIC},
    </if>
     <if test="interest != null ">
      interest = #{interest,jdbcType=NUMERIC},
    </if>
     <if test="penalty != null ">
      penalty = #{penalty,jdbcType=NUMERIC},
    </if>
    <if test="compound != null ">
      compound = #{compound,jdbcType=NUMERIC},
    </if>
    <if test="repaySign != null ">
      repay_sign = #{repaySign,jdbcType=INTEGER},
    </if>
    
    <if test="repayDetail != null and repayDetail != '' ">
      repay_detail = #{repayDetail,jdbcType=VARCHAR},
    </if>
    <if test="bizDate != null ">
      biz_date = #{bizDate,jdbcType=DATE},
    </if>
    updated_at = now()
    where id = #{id,jdbcType=INTEGER}
  </update>
```

###### 编号319
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/ZbbankRepurchaseRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-investment/blob/production/src/main/resources/mapper/ZbbankRepurchaseRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.zbbank.model.ZbbankRepurchaseRecord">
    update zbbank_repurchase_record
    set
    <if test="seqNo != null and seqNo != '' ">
      seq_no = #{requestNo,jdbcType=VARCHAR},
    </if>
    <if test="orderNo != null and orderNo != '' ">
      order_no = #{orderNo,jdbcType=VARCHAR},
    </if>
    <if test="repurchaseAmount != null">
      repurchase_amount = #{repurchaseAmount,jdbcType=NUMERIC},
    </if>
    <if test="principal != null ">
      principal = #{principal,jdbcType=NUMERIC},
    </if>
     <if test="interest != null ">
      interest = #{interest,jdbcType=NUMERIC},
    </if>
     <if test="penalty != null ">
      penalty = #{penalty,jdbcType=NUMERIC},
    </if>
    <if test="compound != null ">
      compound = #{compound,jdbcType=NUMERIC},
    </if>
    <if test="loanDate != null ">
      loan_date = #{loanDate,jdbcType=DATE},
    </if>
    <if test="status != null and status != '' ">
      status = #{status,jdbcType=VARCHAR},
    </if>
    <if test="failedReason != null and failedReason != '' ">
      failed_reason = #{failedReason,jdbcType=VARCHAR},
    </if>
    <if test="bizDate != null ">
      biz_date = #{bizDate,jdbcType=DATE},
    </if>
    updated_at = now()
    where id = #{id,jdbcType=INTEGER}
  </update>
```

###### 编号320
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/DuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/DuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="findOverdueList" resultMap="dues">
        select
        <include refid="Base_Column_List"/>
        from dues where application_id in
        <foreach collection="list" separator="," index="index" item="item" open="(" close=")">
            #{item}
        </foreach>
        and outstanding_amount &gt; 0 and due_date &lt; now() order by application_id,due_type
    </select>
```

###### 编号321
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="findOverdueLoan" resultMap="loans" parameterType="java.util.Map">
        SELECT
        ls.partner_code,ls.application_id
        FROM
        loan_attribute as la join loans as ls on la.application_id = ls.application_id
        WHERE
        ls.partner_code IN ('zbbank', 'xmzbbank','zbbank1')
        AND la.next_repayment_date  &lt; now() and ls.status = 'disbursed' order by ls.id LIMIT #{limit}
        offset #{offset}
    </select>
```

###### 编号322
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<select id="countfindOverdueLoan" resultType="java.lang.Integer">
        SELECT
        count(ls.*)
        FROM
        loan_attribute as la join loans as ls on la.application_id = ls.application_id
        WHERE
        ls.partner_code IN ('zbbank', 'xmzbbank','zbbank1')
        AND la.next_repayment_date  &lt; now() and ls.status = 'disbursed'
    </select>
```

###### 编号323
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/RepurchaseApplicationsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateStatus" parameterType="com.wolaidai.zbbank.salary.model.RepurchaseApplications">
    update repurchase_applications set
    real_interest  = #{item.realInterest},
    status  = #{item.status},
    status_dsc = #{item.statusDsc},
    updated_at = now()
    where application_id = #{item.applicationId}
    </update>
```

###### 编号324
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankFileRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankFileRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertRecord" parameterType="com.wolaidai.zbbank.salary.model.ZbbankFileRecord">
        INSERT INTO zbbank_file_record(upload_date,file_path, total_size,created_at,updated_at)
        VALUES (
          #{record.uploadDate},
          #{record.filePath},
          #{record.totalSize},
          NOW(),
          NOW()
        )
    </insert>
```

###### 编号325
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankRepurchaseRecordMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankRepurchaseRecordMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.zbbank.salary.model.ZbbankRepurchaseRecord">
    update zbbank_repurchase_record
    set
    <if test="seqNo != null and seqNo != '' ">
      seq_no = #{requestNo,jdbcType=VARCHAR},
    </if>
    <if test="orderNo != null and orderNo != '' ">
      order_no = #{orderNo,jdbcType=VARCHAR},
    </if>
    <if test="repurchaseAmount != null">
      repurchase_amount = #{repurchaseAmount,jdbcType=NUMERIC},
    </if>
    <if test="principal != null ">
      principal = #{principal,jdbcType=NUMERIC},
    </if>
     <if test="interest != null ">
      interest = #{interest,jdbcType=NUMERIC},
    </if>
     <if test="penalty != null ">
      penalty = #{penalty,jdbcType=NUMERIC},
    </if>
    <if test="compound != null ">
      compound = #{compound,jdbcType=NUMERIC},
    </if>
    <if test="loanDate != null ">
      loan_date = #{loanDate,jdbcType=DATE},
    </if>
    <if test="status != null and status != '' ">
      status = #{status,jdbcType=VARCHAR},
    </if>
    <if test="failedReason != null and failedReason != '' ">
      failed_reason = #{failedReason,jdbcType=VARCHAR},
    </if>
    <if test="bizDate != null ">
      biz_date = #{bizDate,jdbcType=DATE},
    </if>
    updated_at = now()
    where id = #{id,jdbcType=INTEGER}
  </update>
```

###### 编号326
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankSalaryReimbursesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankSalaryReimbursesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateReimburses" parameterType="com.wolaidai.zbbank.salary.model.ZbbankSalaryReimburses">
        update zbbank_salary_reimburses
        set
        <if test="requestNo != null and requestNo != '' ">
            request_no = #{requestNo,jdbcType=VARCHAR},
        </if>
        <if test="status != null and status != '' ">
            status = #{status,jdbcType=VARCHAR},
        </if>
        <if test="request != null and request != '' ">
            request = #{request,jdbcType=VARCHAR},
        </if>
        <if test="response != null and response != '' ">
            response = #{response,jdbcType=VARCHAR},
        </if>
        <if test="partnerCode != null and partnerCode != '' ">
            partner_code = #{partnerCode,jdbcType=VARCHAR},
        </if>
        updated_at = now()
        where id = #{id,jdbcType=INTEGER}
    </update>
```

###### 编号327
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankSalaryTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankSalaryTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertTransactions" parameterType="com.wolaidai.zbbank.salary.model.ZbbankSalaryTransactions">
        INSERT INTO zbbank_salary_transactions(out_repayment_seq,application_id, action,service_no,status, settle_index, amount,debit_source, repay_model,request,response,user_id,created_at, updated_at,partner_code)
        VALUES (
          #{record.outRepaymentSeq},
          #{record.applicationId},
          #{record.action},
          #{record.serviceNo},
          #{record.status},
          #{record.settleIndex},
          #{record.amount},
          #{record.debitSource},
          #{record.repayModel},
          #{record.request},
          #{record.response},
          #{record.userId},
          NOW(),
          NOW(),
          #{record.partnerCode}
        )
    </insert>
```

###### 编号328
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankSalaryTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankSalaryTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateZbbankSalaryTransactions">
        update zbbank_salary_transactions
        <set>
            <if test="outRepaymentSeq != null">
                out_repayment_seq = #{outRepaymentSeq},
            </if>
            <if test="applicationId != null">
                application_id = #{applicationId},
            </if>
            <if test="action != null">
                action = #{action},
            </if>
            <if test="serviceNo != null">
                service_no = #{serviceNo},
            </if>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="settleIndex != null">
                settle_index = #{settleIndex},
            </if>
            <if test="amount != null">
                amount = #{amount},
            </if>
            <if test="debitSource != null">
                debit_source = #{debitSource},
            </if>
            <if test="repayModel != null">
                repay_model = #{repayModel},
            </if>
            <if test="request != null">
                request = #{request},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            <if test="userId != null">
                user_id = #{userId},
            </if>
            <if test="createdAt != null">
                created_at = #{createdAt},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号329
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankSalaryTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zbbank-salary-investment/blob/production/src/main/resources/mapper/ZbbankSalaryTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="batchInsert" parameterType="com.wolaidai.zbbank.salary.model.ZbbankSalaryTransactions">
        INSERT INTO
        zbbank_salary_transactions(out_repayment_seq,application_id, action,service_no,status, settle_index,
        amount,debit_source,
        repay_model,request,response,user_id,created_at, updated_at,partner_code)
        values
        <foreach collection="list" item="record" index="index" separator=",">
            (
            #{record.outRepaymentSeq},
            #{record.applicationId},
            #{record.action},
            #{record.serviceNo},
            #{record.status},
            #{record.settleIndex},
            #{record.amount},
            #{record.debitSource},
            #{record.repayModel},
            #{record.request},
            #{record.response},
            #{record.userId},
            NOW(),
            NOW(),
            #{record.partnerCode}
            )
        </foreach>
    </insert>
```

###### 编号330
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.zhongan.model.UnderwriteTasks">
        insert into zhongan_enhance_tasks(order_no,user_id,application_id,loan_apply_no,state,step,is_policy_loaded,created_at,updated_at)
        values(#{orderNo},#{userId},#{applicationId},#{loanApplyNo},#{state},#{step},0,now(),now())
	</insert>
```

###### 编号331
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertDetails" parameterType="com.wolaidai.zhongan.model.UnderwriteTaskDetails">
		insert into zhongan_enhance_task_details(order_no,application_id,step,type,description,state,ret_code,ret_msg,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{step},#{type},#{description},#{state},#{retCode},#{retMsg},now(),now())
	</insert>
```

###### 编号332
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateDetails" parameterType="com.wolaidai.zhongan.model.UnderwriteTaskDetails">
        update zhongan_enhance_task_details
        <set>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            updated_at = now()
        </set>
        where id = #{id}
    </update>
```

###### 编号333
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/UnderwriteTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateUnderwriteTasks" parameterType="com.wolaidai.zhongan.model.UnderwriteTasks">
        update zhongan_enhance_tasks
        <set>
            <if test="policyNo != null">
                policy_no = #{policyNo},
            </if>
            <if test="state != null">
                state = #{state},
            </if>
            <if test="isPolicyLoaded != null">
                is_policy_loaded = #{isPolicyLoaded},
            </if>
            <if test="description != null">
                description = #{description},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            <if test="sumInsured != null">
                sum_insured = #{sumInsured},
            </if>
            <if test="insurancePremium != null">
                insurance_premium = #{insurancePremium},
            </if>
            <if test="premiumRate != null">
                premium_rate = #{premiumRate},
            </if>
            <if test="effectiveTime != null">
                effective_time = #{effectiveTime},
            </if>
            <if test="expiryTime != null">
                expiry_time = #{expiryTime},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号334
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZantInsuranceFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZantInsuranceFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="saveFees" parameterType="com.wolaidai.zhongan.model.ZantInsuranceFees">
        insert zhongan_enhance_insurance_fee (
        application_id,index,partner_code,is_topup,lender_id,amount,created_at,updated_at)
        values (#{applicationId},#{index},#{partnerCode},#{isTopup},#{lenderId},
        #{amount},NOW(),NOW())
    </insert>
```

###### 编号335
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZantInsuranceFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZantInsuranceFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateFees" parameterType="com.wolaidai.zhongan.model.ZantInsuranceFees">
    update zhongan_enhance_insurance_fee
    <set>
    <if test="isTopup != null">
    is_topup = #{isTopup},
    </if>
    updated_at = NOW()
    </set>
    where id = #{id}
    </update>
```

###### 编号336
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZantInsuranceFreezeFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZantInsuranceFreezeFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="saveFees" parameterType="com.wolaidai.zhongan.model.ZantInsuranceFreezeFees">
        insert zhongan_enhance_freeze_insurance_fee (
        application_id,partner_code,lender_id,amount,created_at,updated_at)
        values (#{applicationId},#{partnerCode},#{lenderId},
        #{amount},NOW(),NOW())
    </insert>
```

###### 编号337
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZhonganReportsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZhonganReportsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.zhongan.model.ZhonganReports">
        insert into zhongan_enhance_reports(application_id,loan_apply_no,claim_apply_no,report_amount,status,
        user_id,report_period,policy_no,claim_no,report_no,report_date,seq_no,request,created_at,updated_at )
         VALUES (#{applicationId},#{loanApplyNo},#{claimApplyNo},#{reportAmount},#{status},
         #{userId},#{reportPeriod},#{policyNo},#{claimNo},#{reportNo},#{reportDate},#{seqNo},#{request},now(),now());
    </insert>
```

###### 编号338
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZhonganReportsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZhonganReportsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.zhongan.model.ZhonganReports">
        update zhongan_enhance_reports
        <set>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="policyNo != null">
                policy_no = #{policyNo},
            </if>
            <if test="claimNo != null">
                claim_no = #{claimNo},
            </if>
            <if test="reportNo != null">
                report_no = #{reportNo},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号339
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZhonganTransactonsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZhonganTransactonsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insert" parameterType="com.wolaidai.zhongan.model.ZhonganTransactions">
        insert into zhongan_enhance_transactions(application_id,repay_outer_no,loan_apply_no,repay_amount,status,
        user_id,repay_model,repay_type,seq_no,request,created_at,updated_at)
         VALUES (#{applicationId},#{repayOuterNo},#{loanApplyNo},#{repayAmount},#{status},
         #{userId},#{repayMode},#{repayType},#{seqNo},#{request},now(),now());
    </insert>
```

###### 编号340
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZhonganTransactonsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-enhance-trust/blob/production/src/main/resources/mapper/ZhonganTransactonsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="update" parameterType="com.wolaidai.zhongan.model.ZhonganTransactions">
        update zhongan_enhance_transactions
        <set>
            <if test="status != null">
                status = #{status},
            </if>
            <if test="retCode != null">
                ret_code = #{retCode},
            </if>
            <if test="retMsg != null">
                ret_msg = #{retMsg},
            </if>
            <if test="response != null">
                response = #{response},
            </if>
            updated_at = now()
        </set>
        where repay_outer_no = #{repayOuterNo}
    </update>
```

###### 编号341
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/LoansMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/LoansMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateLoanContractCode">
        update loan_procedures
        <set>
            <if test="contractCode != null">
                contract_code = #{contractCode},
            </if>
            updated_at = now()
        </set>
        where application_id = #{applicationId}
    </update>
```

###### 编号342
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/PayTransInfoMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/PayTransInfoMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updatePayTransInfo">
    update pay_trans_info set state=#{state},response=#{response},end_time=now() where third_seq_no=#{seqNo}
  </update>
```

###### 编号343
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayCollectionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayCollectionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="saveRepayCollections" parameterType="com.wolaidai.zhongan.model.RepayCollections" useGeneratedKeys="true" keyProperty="id">
		insert into zhongan_insurance_collection(batch_no,file_name,batch_count,batch_amount,origin_batch_id,collect_status,success_count,success_amount,batch_status,result_note,created_at,updated_at)
		values(#{batchNo},#{fileName},#{batchCount},#{batchAmount},#{orBatchNo},#{collectStatus},#{successCount},#{successAmount},#{batchStatus},#{resultNote},now(),now())
	</insert>
```

###### 编号344
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayCollectionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayCollectionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayCollectionsState">
		update zhongan_insurance_collection
		<set>
			<if test="collectStatus != null">
				collect_status = #{collectStatus},
			</if>
			updated_at = now()
		</set>
		where id = #{id}
	</update>
```

###### 编号345
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayCollectionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayCollectionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayCollectionsStateAndMsg">
		update zhongan_insurance_collection
		<set>
			<if test="collectStatus != null">
				collect_status = #{collectStatus},
			</if>
			<if test="resultNote != null">
				result_note = #{resultNote},
			</if>
			updated_at = now()
		</set>
		where id = #{id}
	</update>
```

###### 编号346
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayCollectionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayCollectionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateBatchRepayCollectionsResult">
		update zhongan_insurance_collection
		<set>
			<if test="collectStatus != null">
				collect_status = #{collectStatus},
			</if>
			<if test="batchStatus != null">
				batch_status = #{batchStatus},
			</if>
			<if test="successCount != null">
				success_count = #{successCount},
			</if>
			<if test="successAmount != null">
				success_amount = #{successAmount},
			</if>
			updated_at = now()
		</set>
		where id = #{id}
	</update>
```

###### 编号347
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayTransactionsState">
    update zhongan_insurance_transactions
    <set>
      <if test="batchId != null">
        batch_id = #{batchId},
      </if>
      <if test="repayOuterNo != null">
        repay_outer_no = #{repayOuterNo},
      </if>
      <if test="repayAmount != null">
        repay_amount = #{repayAmount},
      </if>
      <if test="couponAmount != null">
        coupon_amount = #{couponAmount},
      </if>
      <if test="status != null">
        status = #{status},
      </if>
      <if test="fileStatus != null">
        file_status = #{fileStatus},
      </if>
      <if test="retCode != null">
        ret_code = #{retCode},
      </if>
      <if test="retMsg != null">
        ret_msg = #{retMsg},
      </if>
      <if test="request != null">
        request = #{request},
      </if>
      <if test="requestDetails != null">
        request_details = #{requestDetails},
      </if>
      <if test="response != null">
        response = #{response},
      </if>
      updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号348
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayTransactionsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/RepayTransactionsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateRepayTransactionsListByBatchId">
    update zhongan_insurance_transactions
    <set>
      <if test="fileStatus != null">
        file_status = #{fileStatus},
      </if>
      updated_at = now()
    </set>
    where batch_id = #{batchId}
  </update>
```

###### 编号349
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnDuesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnDuesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertZhongAnDues" parameterType="com.wolaidai.zhongan.model.ZhongAnDues" useGeneratedKeys="true" keyProperty="id">
   insert into zhongan_insurance_dues (loan_outer_no,application_id,index,principal,interest,due_date,created_at,updated_at)
    values (#{loanOuterNo,jdbcType=VARCHAR},#{applicationId,jdbcType=VARCHAR},#{index,jdbcType=INTEGER},
    #{principal,jdbcType=NUMERIC},#{interest,jdbcType=NUMERIC}, #{dueDate,jdbcType=DATE},now(),now()
    )
  </insert>
```

###### 编号350
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnInsuranceFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnInsuranceFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertZhongAnInsuranceFees" parameterType="com.wolaidai.zhongan.model.ZhongAnInsuranceFees">
		insert into zhongan_insurance_fees(application_id,fee_type,amount,created_at,updated_at)
		values(#{applicationId},#{feeType},#{amount},now(),now())
	</insert>
```

###### 编号351
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnInsuranceFeesMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnInsuranceFeesMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertZhongAnExtraFees" parameterType="com.wolaidai.zhongan.model.ExtraFees">
		insert into extra_fees(application_id,user_id,due_type,due_date,amount,settled_amount,outstanding_amount,index_no,created_at,updated_at)
		values(#{applicationId},#{userId},#{dueType},#{dueDate},#{amount},#{settledAmount},#{outstandingAmount},#{indexNo},now(),now())
	</insert>
```

###### 编号352
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnInsurancePremiumsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnInsurancePremiumsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertZhongAnInsurancePremiums" parameterType="com.wolaidai.zhongan.model.ZhongAnInsurancePremiums" useGeneratedKeys="true" keyProperty="id">
   insert into zhongan_insurance_premiums (application_id,withhold_no,status,created_at,updated_at)
    values (#{applicationId,jdbcType=VARCHAR},#{withholdNo,jdbcType=VARCHAR},#{status,jdbcType=VARCHAR},now(),now() )
  </insert>
```

###### 编号353
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnInsurancePremiumsMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnInsurancePremiumsMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateZhongAnInsurancePremiums" parameterType="com.wolaidai.zhongan.model.ZhongAnInsurancePremiums">
    update zhongan_insurance_premiums
    <set>
      <if test="status != null">
        status = #{status},
      </if>
      <if test="withholdNo != null">
        withhold_no = #{withholdNo},
      </if>
      updated_at = now()
    </set>
    where id = #{id}
  </update>
```

###### 编号354
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertZhongAnTask" parameterType="com.wolaidai.zhongan.model.ZhongAnTasks">
		insert into zhongan_insurance_tasks(order_no,user_id,application_id,loan_outer_no,step,description,state,ins_premium,ret_code,ret_msg,created_at,updated_at,loan_date,apply_date,policy_no)
		values(#{orderNo},#{userId},#{applicationId},#{loanOuterNo},#{step},#{description},#{state},#{insPremium},#{retCode},#{retMsg},now(),now(),#{loanDate},#{applyDate},#{policyNo})
	</insert>
```

###### 编号355
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<insert id="insertZhongAnTaskDetails" parameterType="com.wolaidai.zhongan.model.ZhongAnTaskDetails">
		insert into zhongan_insurance_task_details(order_no,application_id,step,type,description,state,ret_code,ret_msg,created_at,updated_at)
		values(#{orderNo},#{applicationId},#{step},#{type},#{description},#{state},#{retCode},#{retMsg},now(),now())
	</insert>
```

###### 编号356
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateZhongAnTaskDetail" parameterType="com.wolaidai.zhongan.model.ZhongAnTaskDetails">
		update zhongan_insurance_task_details
		<set>
			<!--<if test="orderNo != null">
				order_no = #{orderNo},
			</if>-->
			<!--<if test="applicationId != null">
				application_id = #{applicationId},
			</if>-->
			<!--<if test="step != null">
				step = #{step},
			</if>
			<if test="type != null">
				type = #{type},
			</if>-->
			<if test="description != null">
				description = #{description},
			</if>
			<if test="state != null">
				state = #{state},
			</if>
			<if test="retCode != null">
				ret_code = #{retCode},
			</if>
			<if test="retMsg != null">
				ret_msg = #{retMsg},
			</if>
			updated_at = now()
		</set>
		where id = #{id}
	</update>
```

###### 编号357
**git地址**  
[https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnTaskMapper.xml](https://git.wolaidai.com/WelabCo/Lender/zhongan-insurance-investment/blob/production/src/main/resources/mapper/ZhongAnTaskMapper.xml)

**错误原因**  
时间函数  
**错误代码**

```
<update id="updateZhongAnTasks" parameterType="com.wolaidai.zhongan.model.ZhongAnTasks">
		update zhongan_insurance_tasks
		<set>
			<if test="loanOuterNo != null">
				loan_outer_no = #{loanOuterNo},
			</if>
			<if test="policyNo != null">
				policy_no = #{policyNo},
			</if>
			<if test="state != null">
				state = #{state},
			</if>
			<if test="insPremium != null">
				ins_premium = #{insPremium},
			</if>
			<if test="orderNo != null">
				order_no = #{orderNo},
			</if>
			<if test="loanDate != null">
				loan_date = #{loanDate},
			</if>
			<if test="applyDate != null">
				apply_date = #{applyDate},
			</if>
			<if test="description != null">
				description = #{description},
			</if>
			<if test="retCode != null">
				ret_code = #{retCode},
			</if>
			<if test="retMsg != null">
				ret_msg = #{retMsg},
			</if>
			updated_at = now()
		</set>
		where application_id = #{applicationId}
	</update>
```

