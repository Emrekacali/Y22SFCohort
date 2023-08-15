BatchAccountUpdate ba = new BatchAccountUpdate();
database.executeBatch(ba, 20);

BatchAccountUpdate ba = new BatchAccountUpdate();
Id jobId = database.executeBatch(ba, 30);
system.debug('apex job id ==> ' + jobId);


QueueableExample1 qe1 = new QueueableExample1();
Id jobIdQ = System.enqueueJob(qe1); //we can enqueue only those classes which are implementing queueable